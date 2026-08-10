@echo off
REM Script pour lancer le serveur MCP en transport HTTP (Windows)
REM Usage: scripts\run_mcp_http.bat

cd /d %~dp0\..
IF EXIST .venv\Scripts\activate.bat (
  call .venv\Scripts\activate.bat
)
IF NOT EXIST config.yaml IF EXIST config.example.yaml (
  copy config.example.yaml config.yaml
  echo config.yaml created from example. Please edit it if needed.
)
set JARVIS_MCP_TRANSPORT=http
python -m jarvis.mcp_server
