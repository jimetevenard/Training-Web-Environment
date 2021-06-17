
# Lancement nginx
echo "[JIM] Lancons nginx"
sudo nginx


# Lancement code-server
echo "[JIM] Lancons code-server"
/usr/local/bin/code-server --host 0.0.0.0 . --auth none
