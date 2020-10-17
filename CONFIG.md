### Esta configuração usa MySql, caso queira utilizar outro banco de dados, apenas altere a backend/ormconfig.json 
### Como usar:

1. Configurar o arquivo de conexão com o banco de dados backend/ormconfig.json
2. Executar as migrations do backend
3. Configurar IP's do servidor em:
    * web/src/services/api.ts
    * mobile/src/services/api.ts 
    * backend/src/views/images_views.ts
4. Criar .env com seu token do mapbox na pasta web
5. Pronto!

Para iniciar o mobile e o web o comando é o npm/yarn start
Já o backend é npm/yarn dev
