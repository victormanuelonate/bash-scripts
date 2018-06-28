########
####### Script para desemcriptar password del DataSource ############
####### 1.- Cargar las Variables del JAVA WEBLOGIC . ./setDomainEnv.sh
####### 2.- Buscar el password encriptado en jdbc/APP.xml
####### 3.- Editar la path y el password 
####### 4.- Ejecutar java weblogic.WLST Recuperar-Clave-DataSource.py

from weblogic.security.internal import *
from weblogic.security.internal.encryption import *


password = "{AES}at/6m7NXoGiNbX0Az523XMxPvpCyhUT0JuuGNg38BA8="
path = "/u01/Oracle/Middleware/Oracle_Home/user_projects/domains/wls_domain/security/"
encryptionService = SerializedSystemIni.getEncryptionService(path)
cService = ClearOrEncryptedService(encryptionService)
print "password: " + cService.decrypt(password)
