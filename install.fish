set -g CONFIG_PATH "$HOME/.config"

switch (uname)
  case Darwin
    brew bundle
  case Linux
    add-apt-repository ppa:hadret/fswatch
    apt-get update
    apt-get install -y jq ffmpeg fswatch
end

mkdir -p $CONFIG_PATH/fish/conf.d
cp $HOME/.local/share/qc/templates/config.fish $CONFIG_PATH/fish/conf.d/qc.fish
source $CONFIG_PATH/fish/conf.d/qc.fish
