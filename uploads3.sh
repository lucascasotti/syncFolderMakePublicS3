#!/bin/bash

aws --profile $1 s3 sync $2 s3://$3/

DIR="$2"

function list_files()
{
 	if !(test -d "$1") 
		then echo $1; return;
	fi

	cd "$1"
 		# echo; echo `pwd`:; #Display Directory name

 	for i in *
	do
 		if test -d "$i" #if dictionary
 		then 
 			list_files "$i" "$2" "$3" #recursively list files
			cd ..
 		else
 			echo "s3://$3/$1/$i is public"; #Display File name

 			aws --profile $2 s3api put-object-acl --bucket $3 --key "$1/$i" --acl public-read
		fi

	done
}

if [ $# -eq 0 ]
then list_files "$2" "$1" "$3"
	exit 0
fi

for i in $*
do
	DIR="$2"
 	list_files "$DIR" "$1" "$3"
 	shift 1 #To read next directory/file name
done