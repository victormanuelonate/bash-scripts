echo "Variables de ambiente..."
cd /home/oracle/wls_domain/bin
. ./setDomainEnv.sh

java weblogic.WLST ./status.sh
