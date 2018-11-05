#!/bin/gawk -f

BEGIN {
  artista = "";
  musica = "";
  link = "";
  title = "";
}

/^#### .+/ { artista = gensub(/^#### (.+)/, "\\1", "1"); }

/^# .+/ { musica = gensub(/^# (.+)/, "\\1", "g") }

/^http/ {
  link = $0;
  title = artista " - " musica;
  output = "youtube-dl --extract-audio --audio-format mp3 --output '" title\
  ".%(ext)s' " link;
  #print output;
  system(output)
}
