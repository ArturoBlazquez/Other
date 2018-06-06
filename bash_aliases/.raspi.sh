IP="$(sudo nmap -sP "$(hostname -I | sed 's/\([0-9]*\.[0-9]*\.[0-9]*\.\).*/\1*/')" | grep -B2 Raspberry | grep -oiE '([0-9]{1,3}\.){3}[0-9]{1,3}')"

echo "$IP"
echo ""

IP="$(echo "$IP" | head -1)"

echo ssh -Y pi@$IP
ssh -Y pi@$IP
