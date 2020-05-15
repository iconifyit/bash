#!/bin/bash

function dbdump() {

    default_dbuser="root"

    if [ -z "$1" ]
    then
        echo "Database user name: (${default_dbuser}):"
    	read input_dbuser
    fi
    dbuser=$(thisorthat "$input_dbuser" "$default_project")


    if [ -z "$2" ]
    then
        echo "Database name:"
    	read dbname
    fi
    
    if [ -z "$dbname" ]
    then 
        echo "You must enter a database name"
        return 1
    fi
    
    whoami > /tmp/myname
    myname=`cat /tmp/myname`
    
    date >/tmp/x
	sed 's/  / /g' /tmp/x>/tmp/y
	sed 's/:/./g' /tmp/y>/tmp/x
	sed 's/ /./g' /tmp/x>/tmp/y
	awk -F. '{print $8 "." $2 "." $3 "." $4 $5}' /tmp/y>/tmp/x
	VERS=`cat /tmp/x`
   
	mysqldump -u "$dbuser" -p "$1" > /home/"$myname"

	echo "DB dumped to : /home/$myname/$dbname.$VERS.sql"
}