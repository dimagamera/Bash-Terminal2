#! /bit/bash
clear
function Menu(){
echo -e  "\e\033[33m\t1. change of owner\n\t2. change of rights\n\t3. all information\n\t0. Exit\e[0m"
read choice
}

function Owner(){
clear
echo -e "New owner name> " 
read userChoise
echo -e "Group > "
read Group
echo -e "Directory"
read Directory
chown $userChoice:$Group -R $Directory
}

function Rights(){
clear
echo -e "block>"
read block
echo -e "accept >"
read accept
echo -e "directory"
read directory
chmod $block+$accept -R $directory
}

function inform(){
ls -l
/bin/sleep 3
}



	Menu;
	case $choice in
1) Owner; ;;
2) Rights; ;;
3) inform; ;;
0) echo "Bye!"; let exit=false ;;
*) echo "R.T.F.M."; ;;
esac


