#!/bin/bash

HOME=$PWD

# OPTIMUS
echo "Clone OPTIMUS"
git clone https://github.com/ChunyuanLI/Optimus.git

# SciBERT
echo "Clone SciBERT for NER and REL evaluation"
git clone https://github.com/allenai/scibert.git
cd "scibert"

git clone https://github.com/ibeltagy/allennlp.git
cd allennlp
git checkout fp16_and_others
pip install -e .

# install Python dependencies
cd $HOME
pip install -r setup/requirements.txt

echo "Done!"