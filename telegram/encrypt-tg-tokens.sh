#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOKENS_FILE="$DIR/tg-tokens.txt"
RECIPIENTS_FILE="$DIR/age-recipients.txt"
ENCRYPTED_FILE="$DIR/tg-tokens.txt.age"

if ! command -v age >/dev/null 2>&1; then
  echo "age is not installed. Install it first: brew install age" >&2
  exit 1
fi

if [ ! -f "$TOKENS_FILE" ]; then
  echo "Missing local tokens file: $TOKENS_FILE" >&2
  exit 1
fi

if [ ! -s "$RECIPIENTS_FILE" ]; then
  echo "Missing recipients file: $RECIPIENTS_FILE" >&2
  exit 1
fi

age -R "$RECIPIENTS_FILE" -o "$ENCRYPTED_FILE" "$TOKENS_FILE"
echo "Encrypted: $ENCRYPTED_FILE"
