from datasets import load_dataset

def preprocess(example):
    return {
        "input_text": f"Generate documentation for:\n{example['code']}",
        "target_text": example["comment"]
    }

if __name__ == "__main__":
    dataset = load_dataset("sentence-transformers/codesearchnet", "pair")
    processed = dataset.map(preprocess, remove_columns=dataset["train"].column_names)
    processed.save_to_disk("data/code_doc_pairs")
    print("✅ Preprocessed dataset saved at data/code_doc_pairs")
