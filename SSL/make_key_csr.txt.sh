#Para ejecutar 
#openssl req -new -sha256 -nodes -out personal.com.csr -newkey rsa:2048  -keyout personal.com.key -config make_key_csr.txt

#Para Probar
#openssl x509 -noout -modulus -in server.crt | openssl md5
#openssl rsa -noout -modulus -in server.key | openssl md5
#openssl req -noout -modulus -in server.csr | openssl md5
[req]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C=CL
ST=Region Metropolitana
L=Santiago
O=Instituto Personal
OU=Informatica
emailAddress=eguridad@personal.com
CN = *.personal.com

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = personal.com
