# BioVAE
- A pre-trained latent variable language model from biomedical texts.
- The model and results are reported in the paper:
[BioVAE: a pre-trained latent variable language model for biomedical text mining](https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btab702/6390793), Bioinformatics 2021

## Overview
1. Features
- Pre-trained latent variable language models
- Based on [the OPTIMUS framework](https://arxiv.org/pdf/2004.04092.pdf)
- Biomedical texts: 34 million sentences (from 3.35 million PubMed abstracts)

2. Requirement
- Python 3.6
```bash
module load gcc/7.4.0
module load cuda/10.2/10.2.89
module load cudnn/8.1/8.1.1
module load nccl/2.8/2.8.4-1
```

3. Training script
- Training script: we train the model based on the OPTIMUS's script: [run_lm_vae_pretraining_phdist_beta.py](https://github.com/ChunyuanLI/Optimus/blob/master/code/examples/big_ae/run_lm_vae_pretraining_phdist_beta.py)
- We initialize training by [the pre-trained SciBERT model](https://github.com/allenai/scibert) and [the pre-trained GPT-2 model](https://huggingface.co/gpt2/tree/main)

## Setup

1. Download the pre-trained models
```bash
sh setup/download.sh
```

2. Install conda environment
```bash
sh setup/conda-install.sh
```

- Create a conda environment (for the first time)
```bash
. setup/conda-create.sh
```

- Activate the conda environment (every time you run: before installing packages, before running evaluation scripts, etc)
```bash
. setup/conda-activate.sh
```

3. Install dependencies
- [OPTIMUS](https://github.com/ChunyuanLI/Optimus.git), [SciBERT](https://github.com/allenai/scibert.git), and [AllenNLP](https://github.com/ibeltagy/allennlp.git)
- Python dependencies

```bash
sh setup/install-packages.sh
```

## Using
1. Finetune on named entity recognition (NER)

- We used [the SciBERT's evaluation script](https://github.com/allenai/scibert/blob/master/scripts/train_allennlp_local.sh)
- NER tasks: NCBI-disease, JNLPBA, bc5cdr
```bash
sh finetune-ner.sh NCBI-disease
sh finetune-ner.sh JNLPBA
sh finetune-ner.sh bc5cdr
```

2. Finetune on relation extraction (REL)
- REL task: chemprot
```bash
sh finetune-rel.sh chemprot
```

3. Text generation
- Reconstruct sample biomedical input sentences
```bash
sh generate.sh
```

## References
[1] [Optimus: Organizing Sentences via Pre-trained Modeling of a Latent Space](https://arxiv.org/pdf/2004.04092.pdf)

[2] [Optimus (github)](https://github.com/ChunyuanLI/Optimus)

## Citation
```bash
@article{10.1093/bioinformatics/btab702,
    author = {Trieu, Hai-Long and Miwa, Makoto and Ananiadou, Sophia},
    title = "{BioVAE: a pre-trained latent variable language model for biomedical text mining}",
    journal = {Bioinformatics},
    year = {2021},
    month = {10},
    issn = {1367-4803},
    doi = {10.1093/bioinformatics/btab702},
    url = {https://doi.org/10.1093/bioinformatics/btab702},
    note = {btab702},
    eprint = {https://academic.oup.com/bioinformatics/advance-article-pdf/doi/10.1093/bioinformatics/btab702/41135090/btab702.pdf},
}
```