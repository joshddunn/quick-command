function qc.cli.list
  if test -e quick-command.json
    echo "Commands:"
    printf '%s\n' (jq -Sr '.command | keys[] as $k | "\($k) -> \(.[$k])"' quick-command.json)
    printf "\nWatchers:\n"
    printf '%s\n' (jq -Sr '.watch | keys[] as $k | "watch \($k) -> \(.[$k].file) --> \(.[$k].action)"' quick-command.json)
  else
    echo "No qc configuration file found in this directory."
  end
end
