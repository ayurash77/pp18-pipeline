# Telegram settings

Shotmate Panel imports Telegram credentials from this folder.

Local plaintext file:

```text
telegram/tg-tokens.txt
```

This file is ignored by git. It should contain the bot token and chat id.

Encrypted file for remote:

```text
telegram/tg-tokens.txt.age
```

## Encrypt

Install `age`, then run:

```bash
telegram/encrypt-tg-tokens.sh
```

Recipients are listed in:

```text
telegram/age-recipients.txt
```

Use public SSH keys or age recipients there. The private key must stay local.

## Decrypt

```bash
telegram/decrypt-tg-tokens.sh
```

By default it uses `~/.ssh/id_ed25519`. Override it with:

```bash
SHOTMATE_AGE_IDENTITY=/path/to/private/key telegram/decrypt-tg-tokens.sh
```
