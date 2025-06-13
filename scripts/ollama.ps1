# Essential
setx OLLAMA_HOST="0.0.0.0:11434" /M
setx OLLAMA_MODELS "D:\AppStorage\Ollama\Models" /M

# Performance optimized for RTX 3090 Ti
setx OLLAMA_CONTEXT_LENGTH "32768" /M
setx OLLAMA_KEEP_ALIVE "24h" /M
setx OLLAMA_GPU_OVERHEAD "2048" /M
setx OLLAMA_FLASH_ATTENTION "true" /M

# Not needed (AMD/Intel GPU)
setx OLLAMA_INTEL_GPU "false" /M

# Set network binding + CORS origins
setx OLLAMA_HOST "0.0.0.0:11434" /M

# Restrictive (Production)
setx OLLAMA_ORIGINS "http://localhost,https://localhost,http://localhost:*,https://localhost:*,http://127.0.0.1,https://127.0.0.1,http://127.0.0.1:*,https://127.0.0.1:*,http://0.0.0.0,https://0.0.0.0,http://0.0.0.0:*,https://0.0.0.0:*,app://*,file://*,tauri://*,vscode-webview://*,vscode-file://*,http://ollama.services.darkcatalist.com,https://ollama.services.darkcatalist.com,http://ollama.windows.darkcatalist.com,https://ollama.windows.darkcatalist.com,https://openwebui.services.darkcatalist.com,http://openwebui.services.darkcatalist.com" /M
setx OLLAMA_ORIGINS "*" /M

setx OLLAMA_MODELS "D:\AppStorage\Ollama\Models" /M

# CORS origins
# http://localhost,
# https://localhost,

# http://localhost:*,
# https://localhost:*,

# http://127.0.0.1,
# https://127.0.0.1,

# http://127.0.0.1:*,
# https://127.0.0.1:*,

# http://0.0.0.0,
# https://0.0.0.0,

# http://0.0.0.0:*,
# https://0.0.0.0:*,

# http://ollama.services.darkcatalist.com,
# https://ollama.services.darkcatalist.com,

# http://ollama.windows.darkcatalist.com,
# https://ollama.windows.darkcatalist.com,

# https://openwebui.services.darkcatalist.com,
# http://openwebui.services.darkcatalist.com,

# app://*,file://*,tauri://*,vscode-webview://*,vscode-file://*,