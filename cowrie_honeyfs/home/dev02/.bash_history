cd ~/projects/project_gamma_backend
git fetch --all
git checkout feature/new-auth-module
pytest -k "test_token_validation"
docker-compose -f docker-compose.dev.yml up -d
docker logs project_gamma_api_1 -f
vim src/core/auth_service.py
make build
./run_dev_server.sh
