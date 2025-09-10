# Flutter auf dem PATH

## Kontext & Zweck
Durch Eintrag in die PATH-Variable ist `flutter` überall im Terminal verfügbar.

## Befehle (zsh)
```bash
echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
hash -r

