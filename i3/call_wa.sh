#!/bin/bash

inp=$(echo | dmenu -p "wolfram: ")

if [[ -n "$inp" ]]; then
	~/.config/polybar/wa "$inp"
fi
