#!/usr/bin/env zsh

# for tap in $(brew tap); do echo "brew tap $tap"; done
# echo "brew install $(brew list --formula | tr '\n' ' ')"
# echo "brew install --cask $(brew list --cask | tr '\n' ' ')"

brew tap ariga/tap
brew tap coreweave/jo11y
brew tap fluxcd/tap
brew tap hashicorp/tap
brew tap helm/tap
brew tap kudobuilder/tap
brew tap kyverno/chainsaw
brew tap manaflow-ai/cmux
brew tap steipete/tap
brew tap tilt-dev/tap

brew install abseil actionlint ada-url aom argo argocd atlas augeas autoconf autoconf-archive automake awscli azure-cli bash bash-completion@2 blake3 brotli btop buf c-ares ca-certificates cairo calicoctl capstone ccache certbot certifi cffi chainsaw cilium-cli cmake cosign cowsay cryptography ctlptl czg dav1d devspace doppler dtc eksctl erlang erlang@28 eza fastfetch flux fmt fnm fontconfig freetds freetype fribidi fzf gd gdk-pixbuf gettext gh giflib git-filter-repo git-lfs glib gmp gnu-sed gnupg gnutls go go@1.22 gpgme graphite2 graphviz groonga grpcurl gts harfbuzz hdrhistogram_c helm helm-ls highway hiredis htop hubble icu4c@76 icu4c@78 imath ipcalc istioctl jansson jasper jira-cli jo11y jpeg-turbo jpeg-xl jq k3d k9s kargo kind kor krb5 krew kube-ps1 kube-score kubebuilder kubectx kubelogin kubernetes-cli kubescape kubeseal kustomize kuttl-cli kyverno libassuan libavif libcbor libdatrie libdeflate libevent libffi libfido2 libgcrypt libgit2 libgpg-error libidn2 libksba liblinear libmagic libmaxminddb libnghttp2 libnghttp3 libngtcp2 libomp libpng libpq librsvg libslirp libsmi libsodium libssh libssh2 libtasn1 libthai libtiff libtool libunistring libusb libuv libvmaf libx11 libxau libxcb libxdmcp libxext libxrender libyaml lima little-cms2 llhttp lua luajit lz4 lzo m4 mariadb-connector-c mecab mecab-ipadic merve minicom minio-mc mise mlx mlx-c mongocli mongosh mpdecimal msgpack mtr mysql-client nasm nbytes ncurses netpbm nettle ninja nmap node npth oh-my-posh ollama onigmo oniguruma openexr openjph openssl@3 oras p11-kit pandoc pango pcre2 pgloader pigz pinentry pinentry-mac pixman pkgconf poetry protobuf pv pwgen pycparser pydantic pyenv python-packaging python@3.13 python@3.14 qemu rabbitmq rclone readline ripgrep s3cmd s5cmd sbcl shellcheck simdjson simdutf skopeo snappy sonobuoy speexdsp sqlite superfile sysbench talosctl terraform tilt tmux tokei tree trivy unbound unixodbc usage utf8proc uv uvwasi vde watch webp wget wireguard-go wireguard-tools wireshark witr wxwidgets@3.2 xorgproto xxhash xz yq yyjson zlib zoxide zstd

brew install --cask akuity claude-code codex kuttl-cli ngrok

DOTFILES_DIR="${0:A:h}"

if [[ -f "$HOME/.zshrc" && ! -L "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

if [[ -f "$HOME/.tmux.conf" && ! -L "$HOME/.tmux.conf" ]]; then
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup"
fi

ln -sfn "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sfn "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

mkdir -p "$HOME/.config/ohmyposh"
install -m 644 "$DOTFILES_DIR/ohmyposh/zen.json" "$DOTFILES_DIR/ohmyposh/zen-lima.json" "$HOME/.config/ohmyposh"

source "$HOME/.zshrc"

go install github.com/cloudflare/cfssl/cmd/...@latest
go install github.com/goreleaser/goreleaser/v2@latest
go install github.com/pamelia/git-crypt@latest
go install github.com/spf13/cobra-cli@latest

if ! command -v spf >/dev/null 2>&1; then
    bash -c "$(curl -sLo- https://superfile.netlify.app/install.sh)"
fi
