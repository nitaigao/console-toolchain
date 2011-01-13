echo Console Host: $CONSOLE_HOST
PUBKEY=`cat ~/.ssh/id_rsa.pub`
ssh dev@$CONSOLE_HOST "echo ${PUBKEY} >> ~/.ssh/authorized_keys" 
