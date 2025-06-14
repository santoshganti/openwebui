#!/bin/bash

sudo docker exec -it openwebui curl -k "http://openwebui-searxng:8080/search?q=test&format=json"
sudo docker exec -it openwebui curl -k "http://openwebui-searxng:8080"