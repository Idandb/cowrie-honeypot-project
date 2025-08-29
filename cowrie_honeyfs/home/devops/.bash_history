git clone https://github.com/company/app.git
cd app && docker compose up -d
helm list -A
kubectl get svc -A
ansible -i hosts.ini all -m ping
aws s3 ls
