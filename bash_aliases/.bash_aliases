alias hate-waves='./.hate_waves.sh'
alias superlatex='latexmk -pvc -silent -pdf apuntes.tex'
alias twira='xclip -sel clip < .twira'
alias sql='mysql -u alumnodb --password=alumnodb'
alias movilRemote='mono .RemoteMouse/RemoteMouse.exe &'
alias raspi_find="sudo nmap -sP "$(hostname -I | sed 's/\([0-9]*\.[0-9]*\.[0-9]*\.\).*/\1*/')""
alias raspi_connect_slow='. .raspi.sh'
alias raspi_connect='ssh -Y pi@192.168.0.163'
alias getip='curl ipinfo.io/ip'

alias mci="mvn clean install"
alias mcist="mvn clean install -Dmaven.test.skip=true"
alias run="java -jar ./target/inbound-1.0.0-SNAPSHOT.jar"

alias runback="cd ../inbound-rest/; mvn clean install -Dmaven.test.skip=true; java -jar ./target/inbound-1.0.0-SNAPSHOT.jar"
alias runfront="cd ../inbound-angular/; npm run start"
alias xiaomiRmBloat="./Software/Android\ ADB/adb shell pm disable-user com.xiaomi.mipicks"
