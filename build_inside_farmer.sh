#!/bin/bash

APP_NAME="farmer"
APP_VERSION="v1.0.0"

BIN_NAME="${APP_NAME}-${APP_VERSION}-linux-${GOARCH}"

apk add make

make farmer

cp bin/farmer $BIN_NAME 

cat > binary_name.txt <<EOT
$BIN_NAME
EOT
