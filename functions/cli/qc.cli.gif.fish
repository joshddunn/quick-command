function qc.cli.gif
  # default arguments
  set fps 25
  set scale 1080

  # update based on command line arguments
  # in the form ... -argument value
  while set -q argv[1]
    switch $argv[1]
      case '-fps'
        set fps $argv[2] 
      case '-scale'
        set scale $argv[2] 
      case '*'
        break
    end

    set -e argv[1..2]
  end

  if set -q argv[1] 
    # when gif path is not set, we assume same path as movie
    if set -q argv[2]
      set gif_path $argv[2]
    else
      set gif_path (string replace -r '.\w+$' '.gif' $argv[1])
    end

    set -l palette "/tmp/palette.png"
    set -l filters "fps=$fps,scale=$scale:-1:flags=lanczos"

    ffmpeg -v warning -i $argv[1] -vf "$filters,palettegen" -y $palette
    ffmpeg -v warning -i $argv[1] -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $gif_path 
  else
    echo "qc error: Missing movie path."
    false
  end
end
