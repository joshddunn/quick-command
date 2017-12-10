function qc.cli.init
  if test -e quick-command.json
    echo "A qc configuration file already exists in this directory. Please run 'qc cli destroy' first."
  else
    # copy the quick-command file structure
    cp $QC_PATH/templates/quick-command-init.json quick-command.json

    for arg in $argv
      for command in "command" "watch"
        set -l presets (jq -r ".presets.$arg.$command" $QC_PATH/templates/quick-command-presets.json) 
        jq ".$command += $presets" quick-command.json > qc.tmp.json; mv qc.tmp.json quick-command.json
      end
    end

    echo "qc has been initialized" 
  end
end
