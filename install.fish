set -g CONFIG_PATH "$HOME/.config"

brew bundle

cp $HOME/.local/share/qc/templates/config.fish $CONFIG_PATH/fish/conf.d/qc.fish
