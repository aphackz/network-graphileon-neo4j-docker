sudo docker rm $(sudo docker ps --filter=status=exited --filter=status=created -q)
sudo docker rmi $(sudo docker images -a --filter=dangling=true -q)
