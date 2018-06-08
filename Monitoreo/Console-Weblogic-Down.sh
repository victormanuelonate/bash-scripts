#! /bin/bash
##########################################################
#Realizado por Victor Manuel. Mayo 2018 ##
########################Variables#########################
DATE=`date '+%Y-%m-%d %H:%M:%S'`
####################Estado del Server BPM#################
CODIGO=$( curl -s -o /dev/null -w "%{http_code}" http://IP-console/console )
if [ $CODIGO != "302" ]
   then
   echo "Error del BPM $DATE " >> /tmp/dominio.lg
        PID=$(netstat -pvatn | grep 6001  |grep LISTEN|  awk '{print $7}' | cut -d'/' -f 1)
        echo " PID del proceso: $PID " >> /tmp/dominio.lg
           if [[ "$PID" ]]
               then
                kill -9 $PID
         echo "se realizo el kill del proceso: $PID"  >> /tmp/dominio.lg
           fi
echo "Subiendo BPM $DATE" >> /tmp/dominio.lg
sudo -u bpm122prd /u02/app/bpm122prd/domains/BPMPPPRD/subeWebLogic.sh
fi
