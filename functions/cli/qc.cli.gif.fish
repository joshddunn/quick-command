function qc.cli.gif
  if set -q argv[1] 
    if set -q argv[2]
      set file_path argv[2]
    else
      set file_path (string replace -r '.\w+$' '.gif' $argv[1])
    end

    eval "ffmpeg -i $argv[1] -r 10 -f gif - | gifsicle --optimize=3 --delay=5 > $file_path"
  else
    echo "Missing movie path."
  end
end
