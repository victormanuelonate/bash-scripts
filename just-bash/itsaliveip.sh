hostfile="ValiaIP.txt"
IFS= mapfile -t  hosts < <(cat $hostfile)
for host in "${hosts[@]}"; do
 match=$(echo "$host" | grep -o "\-$1_" | sed 's/-//' | sed 's/_//')
  if [[ "$match" = "$1" ]]; then
   hostname=$(echo "$host" | awk '{print $1}')
      ping -c1 -W1 $(echo "$host" | awk '{print $1}') > /dev/null
       if [[ $? = 0 ]]; then
            echo "$hostname alive"
       elif [[ $? = 1 ]]; then
               echo "$hostname dead"
       fi
   fi
done
