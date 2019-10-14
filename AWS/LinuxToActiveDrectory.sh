yum -y install sssd realmd krb5-workstation samba-common-tools
realm join -v -U usuario dominio.gob.cl --install=/
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
systemctl restart sshd.service
echo "%Domain\ Admins@dominio.gob.cl ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
