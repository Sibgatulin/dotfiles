#!/bin/bash
util_mem=$(nvidia-smi --query-gpu=utilization.gpu,utilization.memory --format=csv,noheader,nounits)
if [ $? -eq 0 ]; then
	IFS=', ' read -r -a array <<<"$util_mem"
	usage=${array[0]}
	mem=${array[1]}
	echo '{"text": "'$usage'% | mem '$mem'%", "class": "custom-gpu", "tooltip": "<b>GPU usage:</b> '$usage'\n<b>GPU mem:</b> '$mem'"}'
else
	echo '{"text": "off", "class": "custom-gpu", "tooltip": "<b>GPU:</b> off"}'
fi
