# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx QC_PATH "$XDG_DATA_HOME/qc"
  or set -gx QC_PATH "$HOME/.local/share/qc"

# Load Oh My Fish configuration.
source $QC_PATH/init.fish
