#!/bin/bash
# Google Driveからデータをダウンロードするスクリプト

set -e

# フォルダID（Google Driveの共有リンクから取得）
FOLDER_ID="15lCDsyjXyodQTEwlWiUExA-Xj2QFM77G"
DATA_DIR="./data"

echo "データディレクトリを作成中..."
mkdir -p "$DATA_DIR"

echo "gdown をインストール中..."
pip install gdown

echo "Google Driveから aozora_tokenized をダウンロード中..."
# フォルダ全体をダウンロード
gdown --folder "https://drive.google.com/drive/folders/${FOLDER_ID}?usp=sharing" -O "$DATA_DIR" --remaining-ok

# aozora_tokenized フォルダを確認
if [ -d "$DATA_DIR/aozora_tokenized" ]; then
    echo "✓ ダウンロード完了: $DATA_DIR/aozora_tokenized"
    echo "データパス: $(realpath $DATA_DIR/aozora_tokenized)"
else
    echo "⚠ 警告: aozora_tokenized フォルダが見つかりません"
    echo "手動で確認してください: ls -la $DATA_DIR"
fi

