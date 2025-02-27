#!/usr/bin/env zsh

# echo "brew tap $(brew tap | tr '\n' ' ')"
# echo "brew install $(brew list --formula | tr '\n' ' ')"
# echo "brew install --cask $(brew list --cask | tr '\n' ' ')"

brew tap ariga/tap bufbuild/buf dopplerhq/cli homebrew/cask-fonts homebrew/services jandedobbeleer/oh-my-posh superbrothers/zsh-kubectl-prompt
brew install abseil aom argocd atlas augeas autoconf azure-cli bash bash-completion@2 brotli btop buf c-ares ca-certificates cairo calicoctl certbot certifi cffi cilium-cli cmake cosign cryptography czg dialog doppler eksctl erlang eza fastfetch fnm fontconfig freetds freetype fribidi fzf gd gdk-pixbuf gettext gh giflib glib gmp gnu-sed gnupg gnutls go go@1.22 graphite2 graphviz groonga grpcurl gts harfbuzz helm highway htop icu4c@76 imath jasper jira-cli jpeg-turbo jpeg-xl jq krb5 krew kube-ps1 kube-score kubebuilder kubectx kubernetes-cli kubescape libassuan libavif libcbor libdeflate libevent libfido2 libgcrypt libgit2 libgpg-error libidn2 libksba libmaxminddb libnghttp2 libnghttp3 libpng libpq librsvg libsmi libsodium libssh libssh2 libtasn1 libtiff libtool libunistring libusb libuv libvmaf libx11 libxau libxcb libxdmcp libxext libxrender libyaml little-cms2 lua luajit lz4 lzo m4 mariadb mariadb-connector-c mecab mecab-ipadic minicom minio-mc mongocli mongosh mpdecimal msgpack mysql-client ncurses netpbm nettle node npth oh-my-posh oniguruma openexr openssl@3 p11-kit pango pcre2 pgloader pigz pinentry pinentry-mac pixman pkgconf pnpm poetry postgresql@17 protobuf pv pwgen pycparser pyenv python-cryptography python-packaging python@3.12 python@3.13 rabbitmq rclone readline redis sbcl speexdsp sqlite superfile sysbench talosctl tmux trivy unbound unixodbc utf8proc watch webp wget wireshark wxwidgets xorgproto xz yq zlib zopfli zoxide zsh-kubectl-prompt zstd
brew install --cask font-monaspace

if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

ln -s zshrc "$HOME/.zshrc"

mkdir -p "$HOME/.config/ohmyposh"
install -m 644 zen.json "$HOME/.config/ohmyposh"
