function qc.cli.presets
  if test -e quick-command.json
    eval (jq '.editor' quick-command.json) $QC_PATH/templates/quick-command-presets.json
  else
    echo "No quick-command.json file"
  end
end
