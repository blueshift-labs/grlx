#!/bin/bash

APP_NAME="sprout"
APP_VERSION="v1.0.0"

BIN_NAME="${APP_NAME}-${APP_VERSION}-linux-${GOARCH}"

make sprout

cp bin/sprout $BIN_NAME 

cat > binary_name.txt <<EOT
$BIN_NAME
EOT
