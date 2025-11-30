#!/bin/bash
# Google Driveからデータをダウンロードするスクリプト

set -e

# フォルダID（Google Driveの共有リンクから取得）
FOLDER_ID="1BdFv6DSDPtHZSsJuIvyCkeSZclAjXDY2"
DATA_DIR="./data"

echo "データディレクトリを作成中..."
mkdir -p "$DATA_DIR"

echo "gdown をインストール中..."
pip install gdown

echo "Google Driveから aozora_tokenized をダウンロード中..."
# フォルダ全体をダウンロード
gdown --folder "https://drive.google.com/drive/folders/${FOLDER_ID}?usp=sharing" -O "$DATA_DIR" --remaining-ok

