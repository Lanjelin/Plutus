#!/bin/bash

# Check if plutus files exists, else get
if ! [ -e /plutus/database/database_aa ]
then
    echo 'Fething database from github, this may take a few minutes'
	git clone https://github.com/Lanjelin/plutus-db plutus
fi
if ! [ -e /plutus/plutus.txt ]
then
    cp /plutus.txt /plutus/plutus.txt
fi

# Run the script
re='^[0-9]+$'
if [[ $CPU_COUNT =~ $re ]]
then
  echo "Running plutus with $CPU_COUNT cores."
  python /plutus.py verbose=$VERBOSE substring=$SUBSTRING cpu_count=$CPU_COUNT
else
  echo "Running plutus without cpu core limit."
  python /plutus.py verbose=$VERBOSE substring=$SUBSTRING
fi
