#!/bin/bash
# Original file: https://github.com/allenai/scibert/blob/master/scripts/train_allennlp_local.sh

ROOT=$PWD

export SCIBERT_DIR="scibert"
cd $SCIBERT_DIR

# 1. model path
export MODEL_NAME=pm-full-lt768-beta05
export BERT_VOCAB="../data/scibert_scivocab_cased/vocab.txt"

if [ "$MODEL_NAME" = "pm-full-lt32-beta00" ] || [ "$MODEL_NAME" = "pm-full-lt768-beta00" ]; then
  export GLOBAL_STEP=16700
elif [ "$MODEL_NAME" = "pm-full-lt32-beta05" ] || [ "$MODEL_NAME" = "pm-full-lt768-beta05" ]; then
  export GLOBAL_STEP=16767
elif [ "$MODEL_NAME" = "pm-full-generation" ]; then
  export GLOBAL_STEP=17000
fi

export BERT_WEIGHTS="../data/biovae/$MODEL_NAME/checkpoint-encoder-$GLOBAL_STEP"

# 2. task
TASK="text_classification"
DATASET="$1" # chemprot

# datasize
if [ "$DATASET" = "chemprot" ]; then
  dataset_size=10065
fi
export DATASET_SIZE=$dataset_size

# 3. data path
export TRAIN_PATH=data/$TASK/$DATASET/train.txt
export DEV_PATH=data/$TASK/$DATASET/dev.txt
export TEST_PATH=data/$TASK/$DATASET/test.txt

# 4. configs
with_finetuning='_finetune'  # or '' for not fine tuning
CONFIG_FILE=allennlp_config/"$TASK""$with_finetuning".json

export NUM_EPOCHS=4
export LEARNING_RATE="2e-5"
export GRAD_ACCUM_BATCH_SIZE=32
export IS_LOWERCASE=false

SEED=13270
PYTORCH_SEED=`expr $SEED / 10`
NUMPY_SEED=`expr $PYTORCH_SEED / 10`
export SEED=$SEED
export PYTORCH_SEED=$PYTORCH_SEED
export NUMPY_SEED=$NUMPY_SEED

export CUDA_DEVICE=0

python -m allennlp.run train $CONFIG_FILE  --include-package scibert -s "../results/$TASK/$DATASET/$MODEL_NAME"

cd $ROOT