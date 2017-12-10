function qc.cli.watch
  if set -q argv[1]
    set -l file (jq -r ".watch.$argv[1].file" quick-command.json)
    set -l action (jq -r ".watch.$argv[1].action" quick-command.json)
    if [ "$file" = "null" -o "$action" = "null" ]
      echo "qc error: The command `watch $argv[1]` does not exist or the quick-command.json file is improperly setup."
    else
      set -l num (echo $action | wc -w | xargs)
      echo "Watching $file"
      eval "fswatch -o $file | xargs -n1 -I{$num} $action"
    end
  else
    echo "Invalid number of arguments."
  end
end
