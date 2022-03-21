#!/bin/bash

ROOT=$PWD
DATA_DIR="data"
mkdir -p $DATA_DIR

# scibert
cd $DATA_DIR
wget https://s3-us-west-2.amazonaws.com/ai2-s2-research/scibert/pytorch_models/scibert_scivocab_cased.tar
tar -xvf scibert_scivocab_cased.tar
rm scibert_scivocab_cased.tar
cd scibert_scivocab_cased
tar -xvf weights.tar.gz
rm weights.tar.gz
cd $ROOT

# gpt2
cd $DATA_DIR
GPT2_DIR="gpt2"
mkdir $GPT2_DIR
cd $GPT2_DIR
wget https://s3.amazonaws.com/models.huggingface.co/bert/gpt2-pytorch_model.bin
wget https://s3.amazonaws.com/models.huggingface.co/bert/gpt2-vocab.json
wget https://s3.amazonaws.com/models.huggingface.co/bert/gpt2-merges.txt
wget https://s3.amazonaws.com/models.huggingface.co/bert/gpt2-config.json

mv gpt2-pytorch_model.bin pytorch_model.bin
mv gpt2-vocab.json vocab.json
mv gpt2-merges.txt merges.txt
mv gpt2-config.json config.json
cd $ROOT

# BioVAE
BIOVAE_DIR="data/biovae"
mkdir -p $BIOVAE_DIR
cd $BIOVAE_DIR
wget https://zenodo.org/record/5750954/files/pm-full-lt768-beta05.tar.gz
wget https://zenodo.org/record/5750954/files/pm-full-lt768-beta00.tar.gz
wget https://zenodo.org/record/5750954/files/pm-full-lt32-beta05.tar.gz
wget https://zenodo.org/record/5750954/files/pm-full-lt32-beta00.tar.gz
wget https://zenodo.org/record/5750954/files/pm-full-generation.tar.gz
tar -xvf pm-full-lt768-beta05.tar.gz
tar -xvf pm-full-lt768-beta00.tar.gz
tar -xvf pm-full-lt32-beta05.tar.gz
tar -xvf pm-full-lt32-beta00.tar.gz
tar -xvf pm-full-generation.tar.gz
rm *.tar.gz

cd $ROOT

echo "Done!"