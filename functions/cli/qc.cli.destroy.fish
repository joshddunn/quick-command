function qc.cli.destroy
  if test -e quick-command.json
    rm quick-command.json
    echo "The qc configuration file has been removed."
  else
    echo "No qc configuration file found."
  end
end
