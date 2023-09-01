#!/bin/bash

TASK=$1
MODEL_ARGS=$2
FEW_SHOT=$3
OUTPUT_PATH=$4
PROMPTS_FILE=$5

mkdir -p $OUTPUT_PATH

python main.py \
    --model hf-causal-experimental \
    --model_args $MODEL_ARGS \
    --tasks $TASK  \
    --num_fewshot $FEW_SHOT \
    --batch_size 2 \
    --output_path $OUTPUT_PATH/result.json \
    --prompts_file $PROMPTS_FILE \
    --no_cache --use_prompt &> $OUTPUT_PATH/eval.log


