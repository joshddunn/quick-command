function qc.cli.destroy
  if test -e quick-command.json
    rm quick-command.json
    echo "The qc configuration file has been removed."
  else
    echo "qc error: No qc configuration file found."
    false
  end
end
