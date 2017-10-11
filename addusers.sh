#!/bin/bash
declare -i first_user
declare -i last_user
user_base_name="User"
bank_base_name="Bank"
user_password="cleo"
newline=$'\n'

for bank in {1..300}
do
    first_user=($bank-1)*20+1
    last_user=$bank*20
    commands+="${newline}user ${user_base_name}[${first_user}..${last_user}]:${user_password}@${bank_base_name}${bank} Folderpermission=root,overwrite,upload,download,delete user:local/root/%username"
done
/usr/local/bin/shell.sh << SHELL_FINISH
$commands
SHELL_FINISH
