
# Lancement nginx
echo "[JIM] Lancons nginx"
sudo nginx


# Lancement code-server
# (process attaché, doit être le dernier step)
echo "[JIM] Lancons code-server"
PORT=1991 && echo $PORT && code-server --bind-addr 127.0.0.1:$PORT --auth none --disable-workspace-trust /home/coder/project/