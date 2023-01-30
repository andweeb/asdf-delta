#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/dandavison/delta"
TOOL_NAME="delta"
TOOL_TEST="delta --help"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//'
}

list_all_versions() {
  list_github_tags
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  url="$GH_REPO/releases/download/$version/$filename"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

get_arch() {
  arch=$(uname -m | tr '[:upper:]' '[:lower:]')
  case $arch in
    arm64)
      arch='aarch64'
      ;;
  esac

  echo $arch
}

get_platform() {
  plat=$(uname | tr '[:upper:]' '[:lower:]')

  case $plat in
    darwin)
      plat='apple-darwin'
      ;;
    linux)
      plat='unknown-linux-musl'
      ;;
    windows)
      plat='pc-windows=msvc'
      ;;
  esac

  echo $plat
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  arch="$(get_arch)"
  platform="$(get_platform)"
  local release_file="delta-$version-$arch-$platform.tar.gz"

  (
    mkdir -p "$install_path/bin"
    download_release "$version" "$release_file"
    tar -xzf "$release_file" -C "$install_path/bin" --strip-components=1 || fail "Could not extract $release_file"
    rm "$release_file"

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
