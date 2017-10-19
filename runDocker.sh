# sudo docker ps
# sudo docker exec -it clever_kare bash
# sudo docker rm interactor

sudo docker build -t graphileon .
sudo docker run -p 7474:7474 -p 7473:7473 -p 7687:7687 -p 8000:80 --name interactor -v interactor:/persistent/ graphileon
