### How to apply config

Clone to home dir

```
cd dotfiles
stow .

# Download bibata cursor
# Setup as default to every place I can
ln --symbolic /usr/share/icons/cursor_theme_name ~/.local/share/icons/default
ln --symbolic /usr/share/icons/cursor_theme_name ~/.icons/default/
sudo ln --symbolic /usr/share/icons/cursor_theme_name /usr/share/icons/default/
# If somethings wrong edit the file /usr/share/icons/default/index.theme
```

