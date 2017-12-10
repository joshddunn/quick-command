function qc

  if set -q argv[1]
    set command $argv[1]
    set -e argv[1]
  end

  switch "$command"
    case "cli"
      set -l action $argv[1]
      set -e argv[1]
      set cmd "qc.cli.$action"
    case "-h" "--help"
      set cmd "qc.cli.help"
    case "*"
      set cmd "qc.cli.command $command"
  end

  echo "function __qc_last_command --no-scope-shadowing
    $cmd \$argv
  end" | source

  __qc_last_command $argv

end
