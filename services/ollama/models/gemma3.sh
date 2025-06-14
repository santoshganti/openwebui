#!/bin/bash

ollama pull gemma3:4b
ollama pull gemma3:4b-it-qat

ollama pull gemma3:12b
ollama pull gemma3:12b-it-q4_K_M

ollama pull gemma3:27b
ollama pull gemma3:27b-it-q4_K_M

sudo zfs send -Rv zfspool/appdata/openwebui@auto-2025-06-13_03-13 | ssh unraid sudo zfs receive -F zfspool/appdata/opemwebui

sudo zfs send -Rv zfspool/databases/openwebui@auto-2025-06-13_00-25 | ssh unraid sudo zfs receive -F zfspool/databases/opemwebui