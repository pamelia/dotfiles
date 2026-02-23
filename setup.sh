#!/usr/bin/env zsh

# for tap in $(brew tap); do echo "brew tap $tap"; done
# echo "brew install $(brew list --formula | tr '\n' ' ')"
# echo "brew install --cask $(brew list --cask | tr '\n' ' ')"

brew tap ariga/tap
brew tap helm/tap
brew tap kudobuilder/tap
brew tap steipete/tap
brew tap tilt-dev/tap

brew install abseil ada-url aom argo argocd atlas augeas autoconf awscli azure-cli bash bash-completion@2 brotli btop buf c-ares ca-certificates cairo calicoctl capstone certbot certifi cffi cilium-cli cmake cosign cryptography ctlptl czg dav1d devspace doppler dtc eksctl erlang eza fastfetch fmt fnm fontconfig freetds freetype fribidi fzf gd gdk-pixbuf gemini-cli gettext gh giflib git-filter-repo git-lfs glib gmp gnu-sed gnupg gnutls go go@1.22 gpgme graphite2 graphviz groonga grpcurl gts harfbuzz hdrhistogram_c helm helm-ls highway htop hubble icu4c@76 icu4c@77 icu4c@78 imath ipcalc istioctl jansson jasper jira-cli jpeg-turbo jpeg-xl jq k3d k9s kargo kind kor krb5 krew kube-ps1 kube-score kubebuilder kubectx kubelogin kubernetes-cli kubescape kubeseal kustomize kuttl-cli kyverno libassuan libavif libcbor libdatrie libdeflate libevent libfido2 libgcrypt libgit2 libgpg-error libidn2 libksba liblinear libmaxminddb libnghttp2 libnghttp3 libngtcp2 libpng libpq librsvg libslirp libsmi libsodium libssh libssh2 libtasn1 libthai libtiff libtool libunistring libusb libuv libvmaf libx11 libxau libxcb libxdmcp libxext libxrender libyaml lima little-cms2 llhttp lua luajit lz4 lzo m4 mariadb mariadb-connector-c mecab mecab-ipadic minicom minio-mc mongocli mongosh mpdecimal msgpack mtr mysql-client ncurses netpbm nettle nmap node npth oh-my-posh onigmo oniguruma openexr openjph openssl@3 oras p11-kit pandoc pango pcre2 pgloader pigz pinentry pinentry-mac pixman pkgconf poetry postgresql@17 protobuf pv pwgen pycparser pyenv python-packaging python@3.13 python@3.14 qemu rabbitmq rclone readline redis s5cmd sbcl simdjson skopeo snappy sonobuoy speexdsp sqlite superfile sysbench talosctl terraform tilt tmux tree trivy unbound unixodbc utf8proc uv uvwasi vde watch webp wget wireshark witr wxwidgets@3.2 xorgproto xz yq yyjson zlib zoxide zstd

brew install --cask akuity claude-code ngrok

if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

ln -s zshrc "$HOME/.zshrc"

mkdir -p "$HOME/.config/ohmyposh"
install -m 644 ohmyposh/zen.json ohmyposh/zen-lima.json "$HOME/.config/ohmyposh"

source "$HOME/.zshrc"

go install github.com/cloudflare/cfssl/cmd/...@latest
go install github.com/goreleaser/goreleaser/v2@latest
go install github.com/pamelia/git-crypt@latest
go install github.com/spf13/cobra-cli@latest

if ! command -v spf >/dev/null 2>&1; then
    bash -c "$(curl -sLo- https://superfile.netlify.app/install.sh)"
fi
