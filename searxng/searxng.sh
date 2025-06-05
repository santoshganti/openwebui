#!/bin/bash

sudo docker exec -it openwebui curl -k "https://searxng.services.darkcatalist.com/search?q=test&format=json"

sudo docker exec -it openwebui curl -k "http://openwebui-searxng:8080"

sudo docker exec -it openwebui curl -k "http://10.0.0.20:30068"