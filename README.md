# GLEAM for Better Experiments

Implementation improvements and experimental refinements for  
GLEAM: *Enhanced Transferable Adversarial Attacks for Vision-Language Pre-training Models via Global-Local Transformations*

Original repository:  
https://github.com/LuckAlex/GLEAM/tree/main


## Overview

This repository modified the original GLEAM code for more stable and convenient experiments.

The main goals of this project are:

- Reflecting several ideas described in the paper that were not fully implemented in the original code
- Simplifying the experimental pipeline
- Improving reproducibility and usability
- Providing cleaner execution flow for attack experiments



## Changes

### Paper Implementation Fixes
- Added code to use all adversarial examples generated across every attack step for adversarial text generation
- Adjusted the attack flow to more closely match the methodology described in the paper

### Experimental Improvements
- Added a Bash script to automate running multiple experiments with different configurations sequentially
- Experiment results are now organized into named output directories — specifying an experiment name at runtime creates a dedicated folder where all result files are saved under that name
- Added an option to save the final adversarial examples (images) and adversarial texts generated during each experiment


## Installation

Please follow the environment setup described in the original GLEAM repository:

## Usage

1. Open `run_retrieval.sh`
2. Set SOURCE to the name of the model used to generate adversarial images and texts — must be one of the names listed in model_list
3. Run the script — the experiment name is automatically generated from the SOURCE model name and dataset name, and all result files are saved under that name
4. A single run produces results for attacks on both the Flickr and MS-COCO datasets using the specified source model


Example:
```
#!/bin/bash

SOURCE="CLIP_CNN"
EXP_NAME1="retrieval_flickr_${SOURCE}"
EXP_NAME2="retrieval_coco_${SOURCE}"
STORE=False

# retrieval flickr
 python eval_gleam.py --exp_name ${EXP_NAME1} --config configs/Retrieval_flickr.yaml --source_model ${SOURCE} --model_list ALBEF TCL CLIP_ViT CLIP_CNN \
 --albef_ckpt checkpoints/ALBEF_flickr30k.pth --tcl_ckpt checkpoints/TCL_Retrieval_Flickr_Finetune.pth --store ${STORE} \
 --original_rank_index_path std_eval_idx/flickr30k
 
# retrieval coco
 python eval_gleam.py --exp_name ${EXP_NAME2} --config configs/Retrieval_coco.yaml --source_model ${SOURCE} --model_list ALBEF TCL CLIP_ViT CLIP_CNN \
 --albef_ckpt checkpoints/ALBEF_mscoco.pth --tcl_ckpt checkpoints/TCL_Retrieval_Coco_Finetune.pth --store ${STORE} \
 --original_rank_index_path std_eval_idx/mscoco
```

