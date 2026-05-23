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