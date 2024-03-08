#!/bin/bash

set -uex

GOLANG_VERSION="1.22rc1-alpine"

get_arch()
{
    arch=$(uname -m)

    case "$arch" in
        'x86_64')
            os_arch="x86_64"
            software_arch="amd64"
            ;;

        'aarch64')
            os_arch="aarch64"
            software_arch="arm64"
            ;;

        *)
            echo "***** UNSUPPORTED ARCHITECTURE [$arch] *****"
            exit 1
            ;;
    esac

    return 0
}

get_arch

docker run --name builder --rm -v "$PWD":/code \
    -w /code \
    -e GOARCH="${software_arch}" \
    -e OS_ARCH="${os_arch}" \
    -v "${HOME}"/go/pkg/mod:/root/go/pkg/mod \
    -v "${HOME}"/.cache/go-build:/root/.cache/go-build \
    golang:${GOLANG_VERSION} \
    /bin/sh /code/build_inside_farmer.sh

docker run --name builder --rm -v "$PWD":/code \
    -w /code \
    -e GOARCH="${software_arch}" \
    -e OS_ARCH="${os_arch}" \
    -v "${HOME}"/go/pkg/mod:/root/go/pkg/mod \
    -v "${HOME}"/.cache/go-build:/root/.cache/go-build \
    golang:${GOLANG_VERSION} \
    /bin/sh /code/build_inside_grlx.sh

docker run --name builder --rm -v "$PWD":/code \
    -w /code \
    -e GOARCH="${software_arch}" \
    -e OS_ARCH="${os_arch}" \
    -v "${HOME}"/go/pkg/mod:/root/go/pkg/mod \
    -v "${HOME}"/.cache/go-build:/root/.cache/go-build \
    golang:${GOLANG_VERSION} \
    /bin/sh /code/build_inside_sprout.sh

echo "Done"
