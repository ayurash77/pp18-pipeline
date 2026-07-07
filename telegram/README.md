# Telegram settings

Shotmate Panel imports Telegram credentials from this folder.

Local plaintext file:

```text
telegram/tg-tokens.txt
```

This file is ignored by git. It should contain the bot token and chat id.

Encrypted file for remote:

```text
telegram/tg-tokens.enc.json
```

## Encrypt in Shotmate

1. Open Shotmate settings.
2. Set `Папка данных` to this `pp18-pipeline` clone.
3. Put real credentials into local `telegram/tg-tokens.txt`.
4. Enter a password in the Telegram block.
5. Click `Зашифровать`.

The panel writes `telegram/tg-tokens.enc.json` and pushes it to the repository.

## Decrypt in Shotmate

1. Open Shotmate settings.
2. Set `Папка данных` to this `pp18-pipeline` clone.
3. Enter the same password in the Telegram block.
4. Click `Расшифровать`.

The panel pulls the latest repository state, decrypts `telegram/tg-tokens.enc.json`
into local `telegram/tg-tokens.txt`, and imports Telegram settings.
