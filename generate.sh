#!/bin/bash

HOME=$PWD

export PYTHONPATH="${PYTHONPATH}:$HOME/Optimus/code"

# model paths
export MODEL_NAME=pm-full-generation
export CHECKPOINT_DIR="data/biovae/$MODEL_NAME"
export GLOBAL_STEP=17000
export LATENT_SIZE=768

export BERT_MODEL_DIR="data/scibert_scivocab_cased"
export GPT2_MODEL_DIR="data/gpt2"

# data paths
export SAMPLE_INPUT="data/texts/cg-sample.txt"
export OUTPUT_DIR="results/generation/$MODEL_NAME"
mkdir -p $OUTPUT_DIR

# configs
export PER_GPU_EVAL_BATCH_SIZE=1
export BLOCK_SISE=256

python Optimus/code/examples/big_ae/run_latent_generation.py \
    --dataset=CG_SAMPLE \
    --checkpoint_dir="$CHECKPOINT_DIR" \
    --output_dir="$OUTPUT_DIR" \
    --encoder_model_type=bert \
    --encoder_model_name_or_path="$BERT_MODEL_DIR" \
    --decoder_model_type=gpt2 \
    --decoder_model_name_or_path="$GPT2_MODEL_DIR" \
    --train_data_file="$SAMPLE_INPUT" \
    --per_gpu_eval_batch_size=$PER_GPU_EVAL_BATCH_SIZE \
    --gloabl_step_eval=$GLOBAL_STEP \
    --block_size=$BLOCK_SISE \
    --latent_size=$LATENT_SIZE \
    --play_mode reconstrction

cd $HOME
echo "Done reconstrction."