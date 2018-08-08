
#!/bin/bash

#
for line in `cat ips.txt`
do
    user=`echo $line  | cut -d '@' -f1`;
    ip=`echo $line  | cut -d '@' -f2`;
    powd=`echo $line  | cut -d '@' -f3`;

    echo "connecting the of $ip.."
    echo "================================"
    if sshpass -p $powd ssh $user@$ip '[ ! -d /home/client/received ]';then
       sshpass -p $powd ssh $user@$ip mkdir -m 777 /home/client/received
	 echo "-the received directory successfully created -"    
    
    fi
	echo "--now the files are copying..."
    	echo "--------------------------------"
sleep 5
	sshpass -p $powd scp /home/main/from/transfer/file.txt $user@$ip:/home/client/received	

	echo "--------------------------------"
sleep 5
        echo "-the files are successfully transfered -"
sleep 2
        echo " "
        echo "  Thank you :) "

done

