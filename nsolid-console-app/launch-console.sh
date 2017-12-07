#-------------------------------------------------------------------------------
# This script is only intended to be run on CF, during the the app launch.
#-------------------------------------------------------------------------------

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create / clean out the product subdirectory
cd $SCRIPT_DIR
mkdir -p product
rm -rf product/*

echo "unpacking nsolid-console"
tar -xzf nsolid-console-linux-x64.tar.gz --strip 1 -C product

# set the protocol to http instead of default https
export NSOLID_CONSOLE_WEB_PROTO="http"

echo "launching nsolid-console"
cd product
nsolid nsolid-console.js
