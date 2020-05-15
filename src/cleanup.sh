#!/bin/bash



function cleanup() {

    if [ -z "$1" ]
    then
        echo "You must specify a folder name"
        return 1
    fi
    
    FOLDER=$1
    
    echo "Cleaning up folder $FOLDER"
    
	mkdir $FOLDER/vol-01 2> /dev/null
	mkdir $FOLDER/vol-02 2> /dev/null
	mkdir $FOLDER/vol-03 2> /dev/null
	mkdir $FOLDER/vol-04 2> /dev/null
	mkdir $FOLDER/vol-05 2> /dev/null
	mkdir $FOLDER/vol-06 2> /dev/null
	mkdir $FOLDER/vol-07 2> /dev/null
	mkdir $FOLDER/vol-08 2> /dev/null

	# vol-01
	
	SUBFOLDER=$FOLDER/vol-01
	
	echo "Cleaning up folder $SUBFOLDER"

	mkdir $SUBFOLDER/set-001 2> /dev/null
	mkdir $SUBFOLDER/set-002 2> /dev/null
	mkdir $SUBFOLDER/set-003 2> /dev/null
	mkdir $SUBFOLDER/set-004 2> /dev/null

	mv $FOLDER/*set-001*.png $SUBFOLDER/set-001/
	mv $FOLDER/*set-002*.png $SUBFOLDER/set-002/
	mv $FOLDER/*set-003*.png $SUBFOLDER/set-003/
	mv $FOLDER/*set-004*.png $SUBFOLDER/set-004/

	# vol-02
	
	SUBFOLDER=$FOLDER/vol-02
	
	echo "Cleaning up folder $SUBFOLDER"

	mkdir $SUBFOLDER/set-005 2> /dev/null
	mkdir $SUBFOLDER/set-006 2> /dev/null
	mkdir $SUBFOLDER/set-007 2> /dev/null
	mkdir $SUBFOLDER/set-008 2> /dev/null

	mv $FOLDER/*set-005*.png $SUBFOLDER/set-005/
	mv $FOLDER/*set-006*.png $SUBFOLDER/set-006/
	mv $FOLDER/*set-007*.png $SUBFOLDER/set-007/
	mv $FOLDER/*set-008*.png $SUBFOLDER/set-008/

	# vol-03
	
	SUBFOLDER=$FOLDER/vol-03
	
	echo "Cleaning up folder $SUBFOLDER"

	mkdir $SUBFOLDER/set-009 2> /dev/null
	mkdir $SUBFOLDER/set-010 2> /dev/null
	mkdir $SUBFOLDER/set-011 2> /dev/null
	mkdir $SUBFOLDER/set-012 2> /dev/null

	mv $FOLDER/*set-009*.png $SUBFOLDER/set-009/
	mv $FOLDER/*set-010*.png $SUBFOLDER/set-010/
	mv $FOLDER/*set-011*.png $SUBFOLDER/set-011/
	mv $FOLDER/*set-012*.png $SUBFOLDER/set-012/

	# vol-04
	
	SUBFOLDER=$FOLDER/vol-04
	
	echo "Cleaning up folder $SUBFOLDER"

	mkdir $SUBFOLDER/set-013 2> /dev/null
	mkdir $SUBFOLDER/set-014 2> /dev/null
	mkdir $SUBFOLDER/set-015 2> /dev/null
	mkdir $SUBFOLDER/set-016 2> /dev/null

	mv $FOLDER/*set-013*.png $SUBFOLDER/set-013/
	mv $FOLDER/*set-014*.png $SUBFOLDER/set-014/
	mv $FOLDER/*set-015*.png $SUBFOLDER/set-015/
	mv $FOLDER/*set-016*.png $SUBFOLDER/set-016/

	# vol-05
	
	SUBFOLDER=$FOLDER/vol-05
	
	echo "Cleaning up folder $SUBFOLDER"

	mkdir $SUBFOLDER/set-017 2> /dev/null
	mkdir $SUBFOLDER/set-018 2> /dev/null
	mkdir $SUBFOLDER/set-019 2> /dev/null
	mkdir $SUBFOLDER/set-020 2> /dev/null

	mv $FOLDER/*set-017*.png $SUBFOLDER/set-017/
	mv $FOLDER/*set-018*.png $SUBFOLDER/set-018/
	mv $FOLDER/*set-019*.png $SUBFOLDER/set-019/
	mv $FOLDER/*set-020*.png $SUBFOLDER/set-020/

	# vol-06
	
	SUBFOLDER=$FOLDER/vol-06
	
	echo "Cleaning up folder $SUBFOLDER"

	mkdir $SUBFOLDER/set-021 2> /dev/null
	mkdir $SUBFOLDER/set-022 2> /dev/null
	mkdir $SUBFOLDER/set-023 2> /dev/null
	mkdir $SUBFOLDER/set-024 2> /dev/null

	mv $FOLDER/*set-021*.png $SUBFOLDER/set-021/
	mv $FOLDER/*set-022*.png $SUBFOLDER/set-022/
	mv $FOLDER/*set-023*.png $SUBFOLDER/set-023/
	mv $FOLDER/*set-024*.png $SUBFOLDER/set-024/

	# vol-07
	
	SUBFOLDER=$FOLDER/vol-07
	
	echo "Cleaning up folder $SUBFOLDER"

	mkdir $SUBFOLDER/set-025 2> /dev/null
	mkdir $SUBFOLDER/set-026 2> /dev/null
	mkdir $SUBFOLDER/set-027 2> /dev/null
	mkdir $SUBFOLDER/set-028 2> /dev/null

	mv $FOLDER/*set-025*.png $SUBFOLDER/set-025/
	mv $FOLDER/*set-026*.png $SUBFOLDER/set-026/
	mv $FOLDER/*set-027*.png $SUBFOLDER/set-027/
	mv $FOLDER/*set-028*.png $SUBFOLDER/set-028/

	# vol-08
	
	SUBFOLDER=$FOLDER/vol-08
	
	echo "Cleaning up folder $SUBFOLDER"

	mkdir $SUBFOLDER/set-029 2> /dev/null
	mkdir $SUBFOLDER/set-030 2> /dev/null
	mkdir $SUBFOLDER/set-031 2> /dev/null

	mv $FOLDER/*set-029*.png $SUBFOLDER/set-029/
	mv $FOLDER/*set-030*.png $SUBFOLDER/set-030/
	mv $FOLDER/*set-031*.png $SUBFOLDER/set-031/
	
	echo "Done cleanup"
}
