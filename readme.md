Este es el proyecto nodejs para la aplicacion de PromahosBjj

Pasos para instalar:

1.- Descargar nodejs de su página e instalarla

2.- Moverse a la carpeta raiz del proyecto

3.- Comando: "npm install" - Instala todos los paquetes de los repositorios, crea la carpeta node_modules

4.- Comando "npm install -g mysql" - Instala mysql en el repositorio global de la máquina

5.- Comando "npm install -g sequelize-auto" - Intala sequelize-auto en el repositorio global de la máquina

6.- Comando: "node bin/server.js" Inicia el servidor. 
Para probar los REST, se puede usar un REST client de Chrome
Con Ctrl+C se para

Es importante mantener que se incluya la carpeta node_modules dentro de .gitignore. De modo que, en cada checkout, branch,
debe de volverse a correr npm install. Cuando sea necesario se actualizará package.json

## Base de datos, configuración default
server.js

        host: 'localhost',
        user: 'root',
        password : 'root',
        port : 3306, //port mysql
        database:'promahosbjj'	
		
Modifica las credenciales si tu mysql las tiene distintas

Importa el archivo promahosbjj_<fecha>.sql en un esquema llamado promahosbjj en tu mysql local
Cuando el esquema de la base cambie para un entregable o corrección, se actualizará este sql.
Contiene solo el esquema de tablas y vistas, los catálogos completos y algunos datos de prueba.

Si se necesitan bibliotecas adicionales para alguna función, incluirlas en el archivo package.json bajo dependencies

Dependencias:

-express: Es el api MVC que se utiliza para recibir los request http desde los clientes, y devolver response en formato json.
DOC: http://expressjs.com/en/api.html
-sequelize: ORM para conectarse con la base de datos
DOC: http://docs.sequelizejs.com/en/latest/
-sequelize-auto: Se le pasa una base de datos y automaticamente genera todos los modelos
NOTA: Sequelize por default pide que las tablas tengan las columnas updated_at y created_at. Para desactivar esto, se tiene
que agregar la siguiente la línea timestamps:false al final de cada modelo generato por sequelize-auto 

Directorios:

-bin: Contiene el archivo server.js. Este archivo es el principal que actua como listener y arranca todo 
-config: Configuraciones. El archivo config.json contiene configuraciones para diferentes ambientes de base de datos (test, desarrollo, producción)
-migrations: Destinado para migraciones de datos 
-models: Contiene los modelos mapeados desde la base de datos. Un archivo por cada tabla.
El archivo index.js es el que escanea todos los modelos y configura toda la capa de conexión con la base de datos 
-node_modules: Contiene todas las dependencias descargadas por npm. Esta carpeta no se versiona
-routes: Aquí van los controladores de express, donde rutas de peticiones http se mapean a codigo js
