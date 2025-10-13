function devc-bash(){
  service_code=$1
  

 docker compose -f .devcontainer/docker-compose.yml exec -w /workspaces $service_code bash
}
