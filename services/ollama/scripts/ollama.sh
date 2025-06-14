#!/bin/bash

# Query Container
sudo docker exec -it ollama curl -k "http://openwebui-searxng:8080/search?q=test&format=json"
sudo docker exec -it ollama curl -k "http://openwebui-searxng:8080"

# TrueNAS
sudo docker exec -it ix-ollama-ollama-1 ollama pull qwen2.5vl:7b
sudo docker exec -it ix-ollama-ollama-1 ollama pull qwen2.5vl:7b-q4_K_M
