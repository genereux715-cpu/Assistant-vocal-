# Script pour lancer le serveur MCP en transport HTTP (Linux / macOS)
# Usage: ./scripts/run_mcp_http.sh

set -euo pipefail

ROOT_DIR=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT_DIR"

# Active l'environnement virtuel si présent
if [ -d ".venv" ]; then
  # shellcheck disable=SC1091
  . .venv/bin/activate
fi

# Copie la config exemple si nécessaire
if [ ! -f config.yaml ] && [ -f config.example.yaml ]; then
  cp config.example.yaml config.yaml
  echo "config.yaml created from example. Please edit it if needed."
fi

# Exporte la variable pour forcer HTTP
export JARVIS_MCP_TRANSPORT=http

python -m jarvis.mcp_server
