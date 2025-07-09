#!/usr/bin/env zsh

# for tap in $(brew tap); do echo "brew tap $tap"; done
# echo "brew install $(brew list --formula | tr '\n' ' ')"
# echo "brew install --cask $(brew list --cask | tr '\n' ' ')"

brew tap ariga/tap
brew tap helm/tap
brew tap kudobuilder/tap

brew install abseil aom argo argocd atlas augeas autoconf awscli azure-cli bash bash-completion@2 brotli btop buf c-ares ca-certificates cairo calicoctl certbot certifi cffi cilium-cli cmake cosign cryptography czg doppler eksctl erlang eza fastfetch fnm fontconfig freetds freetype fribidi fzf gd gdk-pixbuf gettext gh giflib git-filter-repo git-lfs glib gmp gnu-sed gnupg gnutls go go@1.22 gpgme graphite2 graphviz groonga grpcurl gts harfbuzz helm highway htop icu4c@76 icu4c@77 imath istioctl jansson jasper jira-cli jpeg-turbo jpeg-xl jq k9s kind kor krb5 krew kube-ps1 kube-score kubebuilder kubectx kubelogin kubernetes-cli kubescape kubeseal kuttl-cli libassuan libavif libcbor libdeflate libevent libfido2 libgcrypt libgit2 libgpg-error libidn2 libksba liblinear libmaxminddb libnghttp2 libnghttp3 libpng libpq librsvg libsmi libsodium libssh libssh2 libtasn1 libtiff libtool libunistring libusb libuv libvmaf libx11 libxau libxcb libxdmcp libxext libxrender libyaml little-cms2 llvm lua luajit lz4 lzo m4 mariadb mariadb-connector-c mecab mecab-ipadic minicom minio-mc mongocli mongosh mpdecimal msgpack mtr mysql-client ncurses netpbm nettle nmap node npth oh-my-posh oniguruma openexr openssl@3 p11-kit pango pcre2 pgloader pigz pinentry pinentry-mac pixman pkgconf pnpm poetry postgresql@17 protobuf pv pwgen pycparser pyenv python-packaging python@3.12 python@3.13 rabbitmq rclone readline redis rust sbcl skopeo sonobuoy speexdsp sqlite superfile sysbench talosctl terraform tmux trivy unbound unixodbc utf8proc uv watch webp wget wireshark wxwidgets xorgproto xz yq z3 zlib zopfli zoxide zstd

if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

ln -s zshrc "$HOME/.zshrc"

mkdir -p "$HOME/.config/ohmyposh"
install -m 644 zen.json "$HOME/.config/ohmyposh"

source "$HOME/.zshrc"

go install github.com/cloudflare/cfssl/cmd/...@latest
go install github.com/goreleaser/goreleaser/v2@latest
go install github.com/pamelia/git-crypt@latest
go install github.com/spf13/cobra-cli@latest

if ! command -v spf >/dev/null 2>&1; then
    bash -c "$(curl -sLo- https://superfile.netlify.app/install.sh)"
fi
