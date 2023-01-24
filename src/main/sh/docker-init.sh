
# Lancement nginx
echo "[JIM] Lancons nginx"
sudo nginx


# Lancement code-server
# (process attaché, doit être le dernier step)
echo "[JIM] Lancons code-server"
code-server --host 0.0.0.0 . --auth none --disable-workspace-trust /home/coder/workspace/