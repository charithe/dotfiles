#!/usr/bin/env bash

set -euo pipefail

download_style() {
    local STYLE="$1"
    local URL="$2"

    wget -O "styles/${STYLE}.zip" "$URL"
    rm -rf "styles/${STYLE}"
    unzip -d styles "styles/${STYLE}.zip"
    rm "styles/${STYLE}.zip"
}

mkdir -p {dicts,styles}

wget -O dicts/en_GB.dic https://spellcheck-dictionaries.github.io/en_GB/en_GB.dic

download_style Microsoft https://github.com/errata-ai/Microsoft/releases/latest/download/Microsoft.zip
download_style Google https://github.com/errata-ai/Google/releases/latest/download/Google.zip
download_style proselint https://github.com/errata-ai/proselint/releases/latest/download/proselint.zip
download_style Readability https://github.com/errata-ai/readability/releases/latest/download/Readability.zip
