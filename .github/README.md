# 自分用セットアップ手順
```
brew install alacritty
brew install tmux
NerdFont確認
brew install neovim
brew install ripgrep
git clone git@github.com:FukeKazki/alacritty-config.git ~/.config/alacritty
# alacrittyフォルダで
tic xterm-256color-italic.terminfo
alacritty再起動
git clone git@github.com:FukeKazki/tmux-config.git ~/.config/tmux
git clone git@github.com:FukeKazki/neovim-config.git ~/.config/nvim
nvimきどう
:PackerSync
```

lspとかの設定 (この辺も設定ファイルから自動で入れてほしい)
nvim上で実行
```
:LspInstall lua
:TSInstall all
```

figを使えるように
```
fig doctor で案内に従う
```
