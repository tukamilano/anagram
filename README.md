# anagram

日本語の46音でアナグラムをするプログラムを作りました.

ひらがなのみの[コーパス](https://huggingface.co/datasets/milano0017/hiragana_aozora)で[KenLM](https://huggingface.co/milano0017/hiragana_KenLM)を学習させ, "自然な"日本語を, perplexityと形態素の数により定量化を行えるようにしました.

46音をどう並べたらより"自然な"日本語になるかをヒューリスティクス問題と考え, 焼きなまし法と4-opt法で最適化しました.
