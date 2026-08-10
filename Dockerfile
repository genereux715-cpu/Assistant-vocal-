# Dockerfile pour exécuter le serveur MCP de Jarvis
# Construction: docker build -t jarvis-mcp .
# Exécution: docker run -p 8765:8765 -v $(pwd)/config.yaml:/app/config.yaml jarvis-mcp

FROM python:3.11-slim

WORKDIR /app

# Copier les fichiers nécessaires
COPY pyproject.toml requirements.txt /app/
COPY . /app

# Install system deps if needed
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8765

CMD ["python", "-m", "jarvis.mcp_server"]
