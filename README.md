# anagram

日本語の46音でアナグラムをするプログラムを作りました.

ひらがなのみの[コーパス](https://huggingface.co/datasets/milano0017/hiragana_aozora)で[KenLM](https://huggingface.co/milano0017/hiragana_KenLM)を学習させ, "自然な"日本語を, perplexityと形態素の数により定量化を行えるようにしました.

46音をどう並べたらより"自然な"日本語になるかをヒューリスティクス問題と考え, 焼きなまし法と4-opt法で最適化しました.

# VMインスタンスでのセットアップ手順

## 1. 環境構築

```bash
cd Bert
bash setup.sh
source venv/bin/activate  # 仮想環境を有効化
```

## 2. データのダウンロード

Google Driveから `aozora_tokenized` データをダウンロード:

```bash
bash setup_data.sh
```

または手動で:

```bash
pip install gdown
gdown --folder "https://drive.google.com/drive/folders/15lCDsyjXyodQTEwlWiUExA-Xj2QFM77G?usp=sharing" -O ./data --remaining-ok
```

## 3. 学習の実行

```bash
wandb login
python learning.py
```

データパスを変更する場合:

```bash
export AOZORA_DATA_PATH="/path/to/your/aozora_tokenized"
python learning.py
```

# 手をつけるべきタスク

- [x] pythonの仮想環境を作る (`setup.sh`)
- [x] データをVMに直接コピー (`setup_data.sh`)
- [ ] export先がほしいかも
- [ ] パラメータ調整
- [ ] VMインスタンスでの作業をCursor上で行いたい
