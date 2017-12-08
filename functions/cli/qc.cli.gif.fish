function qc.cli.gif
  # default arguments
  set r 10
  set delay 5

  # update based on command line arguments
  # in the form ... -argument value
  while set -q argv[1]
    switch $argv[1]
      case '-r'
        set r $argv[2] 
      case '-delay'
        set delay $argv[2] 
      case '*'
        break
    end

    set -e argv[1..2]
  end

  if set -q argv[1] 
    # when gif path is not set, we assume same path as movie
    if set -q argv[2]
      set gif_path argv[2]
    else
      set gif_path (string replace -r '.\w+$' '.gif' $argv[1])
    end

    # commands
    ffmpeg -i $argv[1] -r $r -f gif - | gifsicle --optimize=3 --delay=$delay > $gif_path
  else
    echo "Missing movie path."
  end
end
