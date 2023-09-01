#!/bin/bash
export TRANSFORMERS_CACHE=/work/u5273929/huggingface_hub
export HF_DATASETS_CACHE=/work/u5273929/huggingface_hub
export HUGGINGFACE_HUB_CACHE=/work/u5273929/huggingface_hub


TASK=$1
MODEL_ARGS=$2
FEW_SHOT=$3
OUTPUT_PATH=$4
PROMPTS_FILE=$5

mkdir -p $OUTPUT_PATH

python main.py \
    --model hf-causal-experimental \
    --model_args MODEL_ARGS \
    --tasks $TASK  \
    --num_fewshot $FEW_SHOT \
    --batch_size 2 \
    --output_path $OUTPUT_PATH/result.json \
    --prompts_file $PROMPTS_FILE \
    --no_cache --use_prompt &> $OUTPUT_PATH/eval.log


# python main.py \
#     --model hf-causal-experimental \
#     --model_args pretrained=meta-llama/Llama-2-13b-chat-hf,use_accelerate=True \
#     --tasks arc_challenge  \
#     --num_fewshot 0 \
#     --batch_size 2 \
#     --output_path results/test.json \
#     --no_cache \
#     --limit 2 \
#     --prompts_file prompt.json


