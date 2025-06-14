# OpenWebUI Configuration Repository

Configuration files and model definitions for distributed OpenWebUI deployment.

## Structure

```
services/
├── openwebui/          # Main application configuration
│   ├── .env           # Environment variables
│   └── compose.yaml   # Docker Compose configuration
├── ollama/            # Model management
│   ├── models/        # Model pull scripts by category
│   └── planning/      # Model inventory and planning
└── searxng/           # Search engine configuration
    ├── settings.yml   # SearXNG configuration
    └── uwsgi.ini      # UWSGI server settings
```

## Deployment

1. Configure environment variables in `.env` files
2. Deploy services via Docker Compose
3. Pull models using category-specific scripts

## Architecture

- **OpenWebUI**: Primary interface with GPU acceleration
- **Ollama**: Model serving across multiple hosts
- **pgvector**: Vector database for embeddings
- **SearXNG**: Privacy-focused search integration
- **Auxiliary services**: Tika, Playwright, Gotenberg for document processing

## Current Implementation

- Docker with GPU support
- NVIDIA runtime
- ZFS datasets for persistent storage
- Network configuration for multi-host deployment