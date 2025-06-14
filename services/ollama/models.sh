#!/bin/bash

# bge-m3
ollama pull bge-m3:latest

# paraphrase-multilingual
ollama pull paraphrase-multilingual:latest

# nomic-embed-text
ollama pull nomic-embed-text:latest

sudo docker exec -it ix-ollama-ollama-1 ollama pull