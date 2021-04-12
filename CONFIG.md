### Esta configuração usa MySql, caso queira utilizar outro banco de dados, apenas altere a backend/ormconfig.json 
#### Como usar:

1. Configurar o arquivo de conexão com o banco de dados backend/ormconfig.json
2. Executar as migrations do backend
3. Configurar IP's do servidor em:
    * web/src/services/api.ts
    * mobile/src/services/api.ts 
    * backend/src/views/images_views.ts
4. Criar .env com seu token do mapbox na pasta web
5. Pronto!

Para iniciar o mobile e o web o comando é o `npm start` ou `yarn start`

Já o backend é `npm dev` ou `yarn dev`

#
### This project uses MySql, if you want to use another database system, please alter backend/ormconfig.json 
#### How to setup:

1. Configure database connection's file (backend/ormconfig.json)
2. Execute migrations on the back-end
3. Setup server IP's in:
    * web/src/services/api.ts
    * mobile/src/services/api.ts 
    * backend/src/views/images_views.ts
4. Create a .env file with your Mapbox token in the web folder
5. Ready!

To start the mobile or the web platform, use `npm start` or `yarn start`

To start the back-end server, use `npm dev` or `yarn dev`
