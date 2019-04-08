#!/usr/bin/env bash

clear
function Menu(){
echo -e  "\e\033[33m\t1. Create user\n\t2. Delete user\n\t3. Edit user\n\t0. Exit\e[0m"
read choice
}

function CreateUser(){
clear
echo -e "1. Create user by name\n2. Create user by name + uid + gid"
read userChoise
if (( $userChoise == 1 ))
then 
echo "Enter username: "
read newUserName
cat /etc/passwd | grep $newUserName
if (( $? == 0 ))
then 
echo "User exist!"
else 
useradd $newUserName
passwd $newUserName
fi
cat /etc/passwd | grep $uid
if (( $? == 0 ))
then 
echo "User exist! "
else 
echo "Enter GID: "
read gid
cat /etc/group | grep $gid
if (( $? != 0 ))
then 
echo "Group does no exist! "
else
useradd $newUserName -u $uid -g $gid
passwd $newUserName
fi

fi
else echo "Wrong choise! "
fi
}
exit=true

function DelUser(){
echo "Enter name"
read nameuser
cat /etc/passwd | grep $nameuser
if (( $nameuser == 0 ))
then 
userdel $nameuser -r
else 
echo "User dous not exist!"
fi
}

function menu(){
echo -e "1. Change name\n 2. Change UID\n3. Change GID\n4. Password"
read editUser
if (( $editUser == 1 ))
then 
	echo "Enter username: "
rad editUser
cat /etc/passwd | grep $editUser
if (( $? == 0 ))
then
echo "Enter new name: "
read newName
usermod $editUser -l $newName
else 
echo "User does not exist"
fi
elif (( $editUser == 2 )) 
then
echo "Enter nameUser"
read name
echo "Enter new UID"
read newUid
usermode -u $newUid $name
elif (( $editUser == 3 )) 
then 
echo "Enter nameUser"
read Userr
echo "Enter new GID"
read newGID
usermode -g $newGID $Userr
elif (( $editUser == 4 )) 
then
echo "Enter naUser"
read userpass
echo "Enter new password"
read newpass
usermode -p $newpass $userpass
fi
}

exit=true
while [ $exit == true ]
do
	Menu;
	case $choice in
1) CreateUser; ;;
2) DelUser; ;;
3) EditUser; ;;

0) echo "Bye!"; let exit=false; clear;;
*) echo "R.T.F.M."; ;;
esac
done

