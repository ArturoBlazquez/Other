alias hate-waves='./.hate_waves.sh'
alias superlatex='latexmk -pvc -silent -pdf apuntes.tex'
alias twira='xclip -sel clip < .twira'
alias sql='mysql -u alumnodb --password=alumnodb'
alias movilRemote='mono .RemoteMouse/RemoteMouse.exe &'
alias raspi_find="sudo nmap -sP "$(hostname -I | sed 's/\([0-9]*\.[0-9]*\.[0-9]*\.\).*/\1*/')""
alias raspi_connect_slow='. .raspi.sh'
alias raspi_connect='ssh -Y pi@192.168.0.163'
alias getip='curl ipinfo.io/ip'
