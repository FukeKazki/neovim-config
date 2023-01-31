# 自分用セットアップ手順
```
brew install alacritty
brew install tmux
NerdFont確認
brew install neovim
brew install ripgrep
↓これいらんかも
# git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim 初回起動セットアップ
git clone git@github.com:FukeKazki/alacritty-config.git ~/.config/alacritty
tic xterm-256color-italic.terminfo
alacritty再起動
git clone git@github.com:FukeKazki/tmux-config.git ~/.config/tmux
git clone git@github.com:FukeKazki/neovim-config.git ~/.config/nvim
nvimきどう
:PackerSync
```

lspとかの設定 (この辺も設定ファイルから自動で入れてほしい)
```
LspInstall lua
TSInstall lua
```
