import os
from datasets import load_from_disk
from transformers import (
    AutoTokenizer,
    AutoModelForSeq2SeqLM,
    Seq2SeqTrainer,
    Seq2SeqTrainingArguments,
    DataCollatorForSeq2Seq,
)

def main():
    # ✅ Load preprocessed dataset
    dataset = load_from_disk("/content/drive/MyDrive/AI-Code-Doc-Gen/data/code_doc_pairs")

    # ✅ Load tokenizer and model
    model_name = "Salesforce/codet5-small"
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForSeq2SeqLM.from_pretrained(model_name)

    # ✅ Tokenize function
    def preprocess_function(examples):
        inputs = examples["code"]
        targets = examples["comment"]
        model_inputs = tokenizer(inputs, max_length=256, truncation=True)
        with tokenizer.as_target_tokenizer():
            labels = tokenizer(targets, max_length=128, truncation=True)
        model_inputs["labels"] = labels["input_ids"]
        return model_inputs

    tokenized = dataset.map(preprocess_function, batched=True, remove_columns=["code", "comment"])

    # ✅ Split train/validation
    train_data = tokenized["train"].shuffle(seed=42).select(range(10000))   # subset for quick test
    val_data = tokenized["train"].shuffle(seed=123).select(range(1000))

    # ✅ Data collator
    data_collator = DataCollatorForSeq2Seq(tokenizer, model=model)

    # ✅ Training args
    training_args = Seq2SeqTrainingArguments(
        output_dir="results/sample_outputs",
        evaluation_strategy="epoch",
        learning_rate=5e-5,
        per_device_train_batch_size=8,
        per_device_eval_batch_size=8,
        num_train_epochs=1,   # small for quick test
        weight_decay=0.01,
        save_total_limit=2,
        predict_with_generate=True,
        logging_dir="results/logs",
        logging_steps=50,
        push_to_hub=False,
    )

    # ✅ Trainer
    trainer = Seq2SeqTrainer(
        model=model,
        args=training_args,
        train_dataset=train_data,
        eval_dataset=val_data,
        tokenizer=tokenizer,
        data_collator=data_collator,
    )

    # ✅ Train
    trainer.train()

    # ✅ Save model
    model_dir = "src/models/codet5_finetuned"
    trainer.save_model(model_dir)
    tokenizer.save_pretrained(model_dir)
    print(f"✅ Model saved at {model_dir}")

if __name__ == "__main__":
    main()
