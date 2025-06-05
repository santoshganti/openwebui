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

# Required Configuration for NPM Proxy

# Add your domain to allowed origins
setx OLLAMA_ORIGINS "http://localhost,https://localhost,http://localhost:*,https://localhost:*,http://127.0.0.1,https://127.0.0.1,http://127.0.0.1:*,https://127.0.0.1:*,http://0.0.0.0,https://0.0.0.0,http://0.0.0.0:*,https://0.0.0.0:*,https://ollama.services.darkcatalist.com,http://ollama.services.darkcatalist.com,https://ollama.windows.darkcatalist.com,http://openwebui.services.darkcatalist.com,https://openwebui.windows.darkcatalist.com,http://openwebui.windows.darkcatalist.com,app://*,file://*,tauri://*,vscode-webview://*,vscode-file://*" /M

# Simplified Version (Recommended)

## Allow all origins (for testing)
setx OLLAMA_ORIGINS "*" /M

## Or be more specific to your infrastructure
setx OLLAMA_ORIGINS "https://ollama.services.darkcatalist.com,http://localhost,https://localhost,http://127.0.0.1,https://127.0.0.1,http://0.0.0.0,https://0.0.0.0" /M

## Security Considerations
setx OLLAMA_ORIGINS "*" /M

# Restrictive (Production)
setx OLLAMA_ORIGINS "https://ollama.services.darkcatalist.com,https://openwebui.services.darkcatalist.com" /M

## Required origins for your setup:

# https://ollama.services.darkcatalist.com     # NPM proxy domain
# https://openwebui.services.darkcatalist.com  # If OpenWebUI accesses Ollama
# http://10.0.0.84:11434                       # Direct IP access (testing)
# http://localhost:11434                       # Local testing

# Stop Ollama
# taskkill /f /im ollama.exe

# Set network binding + CORS origins
setx OLLAMA_HOST "0.0.0.0:11434" /M
setx OLLAMA_ORIGINS "https://ollama.services.darkcatalist.com,https://openwebui.services.darkcatalist.com,http://localhost,https://localhost,http://127.0.0.1,https://127.0.0.1,http://0.0.0.0,https://0.0.0.0" /M
setx OLLAMA_MODELS "D:\AppStorage\Ollama\Models" /M


# http://localhost,
# https://localhost,

# http://localhost:*,
# https://localhost:*,

# http://127.0.0.1,
# https://127.0.0.1

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

# app://*,file://*,tauri://*,vscode-webview://*,vscode-file://*