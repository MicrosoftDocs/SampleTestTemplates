#!/bin/bash
echo "Node.Js check started"
found=$(find -name '*.js' | wc -l)
if (( $found == 0)); then
    echo "Js files not found!"
	exit 1 
fi
echo "Check results:"
find -name '*.js' | xargs -n1 node --check