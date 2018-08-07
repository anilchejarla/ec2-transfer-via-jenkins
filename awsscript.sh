
#!/bin/bash

#
for line in `cat ips.txt`
do
    user=`echo $line  | cut -d '@' -f1`;
    ip=`echo $line  | cut -d '@' -f2`;
    powd=`echo $line  | cut -d '@' -f3`;

    echo "connecting the of $ip.."
    echo "================================"
    if sshpass -p $powd ssh $user@$ip '[ ! -d /home/bird/received1 ]';then
       sshpass -p $powd ssh $user@$ip mkdir -m 777 /home/bird/received1
    echo "-the files are successfully created -"
    fi

	sshpass -p $powd scp /home/ant/sample1/file1 $user@$ip:/home/bird/received1

    echo "--------------------------------"
    echo "-the files are successfully transfered -"
    echo "--------------------------------"
done

