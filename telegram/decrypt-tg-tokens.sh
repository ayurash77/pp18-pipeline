#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IDENTITY_FILE="${SHOTMATE_AGE_IDENTITY:-$HOME/.ssh/id_ed25519}"
TOKENS_FILE="$DIR/tg-tokens.txt"
ENCRYPTED_FILE="$DIR/tg-tokens.txt.age"

if ! command -v age >/dev/null 2>&1; then
  echo "age is not installed. Install it first: brew install age" >&2
  exit 1
fi

if [ ! -f "$IDENTITY_FILE" ]; then
  echo "Missing private identity file: $IDENTITY_FILE" >&2
  exit 1
fi

if [ ! -f "$ENCRYPTED_FILE" ]; then
  echo "Missing encrypted tokens file: $ENCRYPTED_FILE" >&2
  exit 1
fi

age -d -i "$IDENTITY_FILE" -o "$TOKENS_FILE" "$ENCRYPTED_FILE"
chmod 600 "$TOKENS_FILE"
echo "Decrypted: $TOKENS_FILE"
