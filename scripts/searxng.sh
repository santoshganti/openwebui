#!/bin/bash

sudo docker exec -it openwebui curl -k "http://openwebui-searxng:8080/search?q=Google&format=json"
sudo docker exec -it openwebui curl -k "http://openwebui-searxng:8080"

sudo docker exec -it openwebui curl -k "http://openwebui-playwright:3000"