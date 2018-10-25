echo "Node.Js check started"
pwd
ls
echo "Found files:"
find -name '*.js'
echo "Check results:"
find -name '*.js' | echo
set -o pipefail
find -name '*.js' | xargs node --check