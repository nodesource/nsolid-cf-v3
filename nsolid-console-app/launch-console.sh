#-------------------------------------------------------------------------------
# This script is only intended to be run on CF, during the the app launch.
#-------------------------------------------------------------------------------

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create / clean out the product subdirectory
cd $SCRIPT_DIR
mkdir -p product
rm -rf product/*

# get some os-specific info
echo ""
echo "lsb_release -a"
echo "-----------------------------"
lsb_release -a

echo ""
echo "uname -a"
echo "-----------------------------"
uname -a

echo ""
echo "cat /etc/*release"
echo "-----------------------------"
cat /etc/*release

echo ""
echo "unpacking nsolid-console"
echo "-----------------------------"
tar -xzf nsolid-console-linux-x64.tar.gz --strip 1 -C product

# set the protocol to http instead of default https
export NSOLID_CONSOLE_WEB_PROTO="http"

echo ""
echo "launching nsolid-console"
echo "-----------------------------"
cd product
nsolid nsolid-console.js
