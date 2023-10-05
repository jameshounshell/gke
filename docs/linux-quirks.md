docker can't connect to podman socket
=====================================
- sudo apt install podman
```
systemctl --user enable podman.socket
systemctl --user start podman.socket
systemctl --user status podman.socket
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
```



add the ability to user to add sub uids/gids
https://github.com/containers/podman/issues/15611
```
sudo usermod --add-subuids 10000-75535 james
sudo usermod --add-subgids 10000-75535 james
podman system migrate
```