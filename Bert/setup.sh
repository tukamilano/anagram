#!/bin/bash
# VMインスタンス用の環境構築スクリプト

set -e

echo "=== BERT学習環境のセットアップ ==="

# 1. Python仮想環境を作成
echo "1. Python仮想環境を作成中..."
python3 -m venv venv
source venv/bin/activate

# 2. 依存関係をインストール
echo "2. 依存関係をインストール中..."
pip install --upgrade pip
pip install -r requirements.txt

# 3. データディレクトリを作成
echo "3. データディレクトリを作成中..."
mkdir -p data

echo ""
echo "=== セットアップ完了 ==="
echo ""
echo "次のステップ:"
echo "1. データをダウンロード: bash setup_data.sh"
echo "2. 学習を実行: python learning.py"
echo ""
echo "注意: 仮想環境を有効化するには 'source venv/bin/activate' を実行してください"

