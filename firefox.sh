#!/bin/bash
install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- |tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
cat >/etc/apt/preferences.d/mozilla<<EOF
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
EOF 
apt-get update
apt-get -o Dpkg::Options::="--force-confdef" -y install gcc make xfce4 xfce4-goodies tightvncserver firefox firefox-l10n-zh-cn
echo 'export USER=root' >> /root/.bashrc
source /root/.bashrc;apt-get -y install fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy

PASSWORD='thanksCOLAB'
export USER='root'
mkdir -p "${HOME}/.vnc"
printf "%s\n%s\n" "$PASSWORD" "$PASSWORD" | vncpasswd -f > "${HOME}/.vnc/passwd"
chmod 600 "${HOME}/.vnc/passwd"
echo "VNC passwd file written to ${HOME}/.vnc/passwd"
/usr/bin/vncserver :1 -localhost -nolisten tcp -geometry 1280x800 -depth 16
