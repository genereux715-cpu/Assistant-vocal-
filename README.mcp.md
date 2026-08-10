# README section ajoutée pour lancer localement et depuis un téléphone

## Lancer le serveur MCP en HTTP (exposé sur le réseau local)

Scripts ajoutés:
- scripts/run_mcp_http.sh (Linux/macOS)
- scripts/run_mcp_http.bat (Windows)
- scripts/tunnel_ngrok.sh (Linux/macOS)

Docker:
- Dockerfile
- docker-compose.yml

Commandes rapides:

1. Crée un environnement virtuel et installe les dépendances:

   python3 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt

2. Copie la config d'exemple puis modifie `mcp.host` en `0.0.0.0` et `mcp.transport` en `http`:

   cp config.example.yaml config.yaml
   # Édite config.yaml, change ces valeurs:
   # mcp:
   #   transport: "http"
   #   host: "0.0.0.0"
   #   port: 8765

3. Lancer le serveur (Linux/macOS):

   ./scripts/run_mcp_http.sh

4. Depuis ton téléphone (même réseau Wi‑Fi):

   Ouvre `http://<IP_DE_TON_PC>:8765`

5. Pour accès depuis Internet (optionnel / sécurisé):

   - Utiliser ngrok: ./scripts/tunnel_ngrok.sh
   - Ou configurer un reverse-proxy + HTTPS (Caddy/Nginx) avec NAT si besoin.
