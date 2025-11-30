from datasets import load_from_disk
from transformers import (
    AutoTokenizer,
    AutoModelForMaskedLM,
    DataCollatorForLanguageModeling,
    Trainer,
    TrainingArguments,
)
import wandb
import os

MODEL_NAME = "tohoku-nlp/bert-base-japanese-v3"

# データパスの設定（環境変数で上書き可能）
DATA_PATH = os.getenv("AOZORA_DATA_PATH", "./data")

# 1. tokenizer & model ロード
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)
model = AutoModelForMaskedLM.from_pretrained(MODEL_NAME)

def main():
    wandb.init(project="bert_continual_pretrain")
    tokenized = load_from_disk(DATA_PATH)

    # 5. MLM masking
    data_collator = DataCollatorForLanguageModeling(
        tokenizer=tokenizer,
        mlm=True,
        mlm_probability=0.15,
    )

    # 6. TrainingArguments
    training_args = TrainingArguments(
        output_dir="./bert_japanese_v3_continual",
        overwrite_output_dir=True,
        num_train_epochs=1,                     # ★ epoch = 1
        per_device_train_batch_size=16,    
        per_device_eval_batch_size=16,
        learning_rate=1e-5,
        weight_decay=0.01,
        warmup_steps=500,
        logging_strategy="steps",
        logging_steps=200,
        save_steps=2000,
        eval_steps=2000,
        report_to=["wandb"],
        save_total_limit=1,                     # 保存少なくして軽量化
        fp16=False,
        bf16=True                
    )

    # 7. Trainer
    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=tokenized["train"],
        eval_dataset=tokenized["validation"],
        data_collator=data_collator,
    )

    # 8. 学習
    trainer.train()

    # 9. 最終モデル保存（tokenizerは保存しない）
    trainer.save_model("./bert_japanese_v3_continual/final") #ドライブに保存する


if __name__ == "__main__":
    main()