#!/bin/bash
declare -i first_user
declare -i last_user
user_base_name="User"
bank_base_name="Bank"
user_password="cleo"
number_banks=300
users_per_bank=20
newline=$'\n'

for bank_num in $(seq 1 ${number_banks})
do
    first_user=(${bank_num}-1)*${users_per_bank}+1
    last_user=${bank_num}*${users_per_bank}
    commands+="${newline}user ${user_base_name}[${first_user}..${last_user}]:${user_password}@${bank_base_name}${bank_num} Folderpermission=root,overwrite,upload,download,delete user:local/root/%username"
done
/usr/local/bin/shell.sh << SHELL_FINISH
$commands
SHELL_FINISH
