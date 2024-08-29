## Restoring dotfiles

### Using GNU `stow`

- restore all dotfiles

```bash
stow $(find . -mindepth 1 -maxdepth 1 -type d ! -name ".git" -exec basename {} \;)
```

- delete all stowed dotfiles

```bash
stow -D $(find . -mindepth 1 -maxdepth 1 -type d ! -name ".git" -exec basename {} \;)
```
