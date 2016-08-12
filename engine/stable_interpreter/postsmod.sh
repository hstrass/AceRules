#!/bin/bash

# transform clingo -V0 output to a sequence of Prolog-"read/2"-able terms of the form model([atom{, atom}^*])

while IFS= read -r line || [[ -n $line ]]
do
    if [[ "$line" == "UNSATISFIABLE" ]]
    then
	:
    elif [[ "$line" == "SATISFIABLE" ]]
    then
	:
    else
	this_output="model(["
	left_delimiter=""
	
	for atom in $line
	do
	    this_output+="${left_delimiter}${atom}"
	    left_delimiter=","
	done
	this_output+="])."
	echo "$this_output"
    fi
done
