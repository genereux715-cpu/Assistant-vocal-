# Script pour lancer un tunnel ngrok et afficher l'URL publique (Linux/macOS)
# Requis: ngrok installé et ngrok authtoken configuré
# Usage: ./scripts/tunnel_ngrok.sh

if ! command -v ngrok >/dev/null 2>&1; then
  echo "ngrok n'est pas installé. Voir https://ngrok.com/download"
  exit 1
fi

PORT=8765
ngrok http $PORT --log=stdout &
NGROK_PID=$!

sleep 2
curl -s http://127.0.0.1:4040/api/tunnels | python -c "import sys, json; print('\n'.join(t['public_url'] for t in json.load(sys.stdin)['tunnels']))"

echo "ngrok lancé (pid $NGROK_PID). Pour l'arrêter: kill $NGROK_PID"
