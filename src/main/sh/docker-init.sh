
# Lancement nginx
echo "[JIM] Lancons nginx"
sudo nginx


# Lancement code-server
# (process attaché, doit être le dernier step)
echo "[JIM] Lancons code-server"
PORT=1991 && code-server --auth none --disable-workspace-trust /home/coder/project