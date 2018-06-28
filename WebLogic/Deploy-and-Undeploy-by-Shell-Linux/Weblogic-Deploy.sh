#!/bin/bash
echo "Respaldando del WAR"
cp /home/oracle/wls_domain/servers/AdminServer/upload/APP.war /tmp/APP.war.bak`date +"%Y%m%d%H%M"`

echo "Variables de ambiente..."
cd /home/oracle/wls_domain/bin
. ./setDomainEnv.sh

echo "Eliminando despliegue afper-consulta..."
java weblogic.WLST ./undeploy.py

echo "Copiando componente ..."
cp /tmp/NEW-APP.war /home/oracle/wls_domain/servers/AdminServer/upload/APP.war

echo "Desplegando afper-consulta..."
java weblogic.WLST ./deploy.py
