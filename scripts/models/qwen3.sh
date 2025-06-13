#!/bin/bash

# qwen3:1.7b
ollama pull qwen3:1.7b # 1.4GB

# qwen3:4b
ollama pull qwen3:4b # 2.6GB
ollama pull qwen3:4b-fp16 # 8.1GB

# qwen3:8b
ollama pull qwen3:8b # 5.2GB
ollama pull qwen3:8b-fp16 # 16GB

# qwen3:14b
ollama pull qwen3:14b # 9.3GB
ollama pull qwen3:14b-q8_0 # 16GB

# qwen3:30b
ollama pull qwen3:30b # 19GB

# qwen3:32b
ollama pull qwen3:32b # 20GB
ollama pull qwen3:32b-q4_K_M #20GB

# qwen3:30b-a3b
ollama pull qwen3:30b-a3b # 19GB
ollama pull qwen3:30b-a3b-q4_K_M # 19GB
