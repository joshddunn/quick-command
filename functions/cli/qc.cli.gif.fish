function qc.cli.gif
  eval "ffmpeg -i $argv[1] -r 10 -f gif - | gifsicle --optimize=3 --delay=5 > $argv[2]"
end
