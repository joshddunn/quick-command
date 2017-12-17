function qc.cli.command
  if set -q argv[1]
    set -l value (jq -r ".command.$argv[1]" quick-command.json)
    if [ "$value" = "null" ] 
      echo "qc error: The command `$argv[1]` does not exist."
      false
    else
      switch (count $argv)
        case 1
          eval $value
        case '*'
          eval $value (string escape -- $argv[2..-1])
      end
    end
  else
    echo "qc error: Invalid number of arguments."
    false
  end
end
