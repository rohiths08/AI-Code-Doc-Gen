from datasets import load_dataset

def get_code_doc_pairs():
    """
    Load CodeSearchNet dataset (code + documentation pairs).
    """
    print("🔄 Loading dataset...")
    dataset = load_dataset("sentence-transformers/codesearchnet", "pair")
    print(dataset)
    return dataset

if __name__ == "__main__":
    ds = get_code_doc_pairs()
    print(ds["train"][0])  # show first example
