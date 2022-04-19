#!/bin/sh

set -eux;

GOLANG_VERSION=1.14.4
dpkgArch="amd64"
goRelArch='linux-amd64' 
goRelSha256='aed845e4185a0b2a3c3d5e1d0a35491702c55889192bb9c30e67a3de6849c067'
url="https://golang.org/dl/go${GOLANG_VERSION}.${goRelArch}.tar.gz";

wget -O go.tgz "$url"
echo "${goRelSha256} *go.tgz" | sha256sum -c -
tar -C /usr/local -xzf go.tgz
rm go.tgz;

# Environment variables
echo "export GOPATH=\"/go\"" >> /etc/profile.d/env_go.sh
echo "export PATH=\"/usr/local/go/bin:\$PATH\"" >> /etc/profile.d/env_go.sh
echo "export PATH=\"\${PATH}:\${GOPATH}/bin\"" >> /etc/profile.d/env_go.sh
source /etc/profile.d/env_go.sh

go version
mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Build Go tools w/module support
mkdir -p /tmp/gotools \
    && cd /tmp/gotools \
    && GOPATH=/tmp/gotools GO111MODULE=on go get -v golang.org/x/tools/gopls@latest 2>&1 \
    && GOPATH=/tmp/gotools GO111MODULE=on go get -v \
        honnef.co/go/tools/...@latest \
        golang.org/x/tools/cmd/gorename@latest \
        golang.org/x/tools/cmd/goimports@latest \
        golang.org/x/tools/cmd/guru@latest \
        golang.org/x/lint/golint@latest \
        github.com/mdempsky/gocode@latest \
        github.com/cweill/gotests/...@latest \
        github.com/haya14busa/goplay/cmd/goplay@latest \
        github.com/sqs/goreturns@latest \
        github.com/josharian/impl@latest \
        github.com/davidrjenni/reftools/cmd/fillstruct@latest \
        github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest  \
        github.com/ramya-rao-a/go-outline@latest  \
        github.com/acroca/go-symbols@latest  \
        github.com/godoctor/godoctor@latest  \
        github.com/rogpeppe/godef@latest  \
        github.com/zmb3/gogetdoc@latest \
        github.com/fatih/gomodifytags@latest  \
        github.com/mgechev/revive@latest  \
        github.com/go-delve/delve/cmd/dlv@latest 2>&1 \
    && GOPATH=/tmp/gotools go get -v github.com/alecthomas/gometalinter 2>&1 \
    && GOPATH=/tmp/gotools go get -x -d github.com/stamblerre/gocode 2>&1 \
    && GOPATH=/tmp/gotools go build -o gocode-gomod github.com/stamblerre/gocode \
    && mv /tmp/gotools/bin/* /usr/local/bin/ \
    && mv gocode-gomod /usr/local/bin/ \
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin 2>&1 \
    && rm -rf /tmp/gotools