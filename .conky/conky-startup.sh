sleep 5s
killall conky
cd "/home/arturo/.conky/TeejeeTech"
conky -c "/home/arturo/.conky/TeejeeTech/CPU Panel (4-core)" &
cd "/home/arturo/.conky/clock"
conky -c "/home/arturo/.conky/clock/.conkyrc" &
cd "/home/arturo/.conky"
conky -c "/home/arturo/.conky/mystats" &
