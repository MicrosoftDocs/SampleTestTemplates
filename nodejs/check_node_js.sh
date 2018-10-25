#!/bin/bash
echo "Node.Js check started"
echo "Found files:"
find -name '*.js'
echo "Check results:"
find -name '*.js' | xargs node --check