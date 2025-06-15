#!/bin/bash

# Espera o MySQL subir
sleep 20

# Loop para múltiplos repositórios
if [ -f /scripts/repos.json ]; then
  REPOS=$(jq -c '.[]' /scripts/repos.json)
  for repo in $REPOS; do
    OWNER=$(echo $repo | jq -r '.owner')
    NAME=$(echo $repo | jq -r '.repo')
    echo "Configurando coleta para $OWNER/$NAME..."

    curl -X POST http://localhost:4000/pipelines -H 'Content-Type: application/json' \
      -d "{ \"plugin\": \"github\", \"options\": { \"githubToken\": \"$GITHUB_TOKEN\", \"owner\": \"$OWNER\", \"repo\": \"$NAME\" } }"
  done
else
  echo "/scripts/repos.json não encontrado. Pulando coleta múltipla."
fi

# Provisiona dashboards personalizados
curl -X POST http://localhost:3000/api/dashboards/db \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${GRAFANA_API_TOKEN}" \
  -d @/scripts/dashboards/dora.json

# Confirmação
echo "Repos configurados, dashboards provisionados e identidade Invillia aplicada."
