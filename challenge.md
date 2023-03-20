Docker:
    1. Se requiere dockerizar un proyecto de Python utilizando el framework web Django que tiene las siguientes características:
    • La versión de Python es 3.8
    • Las dependencias están dentro de un archivo requirements.txt en el root del proyecto
    • La aplicación se expone en el puerto 8000
    • La aplicación se despliega con Gunicorn
    • La aplicación funciona perfectamente en una distribución Ubuntu 22.04
    • El nombre de la aplicación es “bigbox”

Elabore un Dockerfile que permita ejecutar la aplicación en un ambiente productivo.

    2. Elabore un docker-compose.yml con un servicio llamado bigbox-django utilizando el Dockerfile del paso anterior, este servicio debe contar con las siguientes características:
        a. Nombre del servicio: bigbox-django
        b. Nombre del contenedor: bigbox-django
        c. Dockerfile: Dockerfile del apartado 1
        d. ENV_FILE: .env
        e. Comando de ejecución del contendor: python manage.py runserver
        f. Puerto: 8000

    3. Agregue al docker-compose.yml del apartado 2 un servicio llamado bigbox-database, el cual tiene que tener las siguientes características:
        a. Nombre del servicio: bigbox-database
        b. Nombre del contenedor: bigbox-database
        c. Imagen: Postgresql  13.5
        d. Puerto: 5432
        e. Utilizar las siguientes variables de entorno:
            i. POSTGRES_USER=postgres
            ii. POSTGRES_PASSWORD=postgres
            iii. POSTGRES_DB=bigbox

    4. Utilizando de base el archivo del apartado 3, cree las configuraciones necesarias para que ambos contenedores se puedan comunicar de forma correcta.
Cloud Run:
    1. Genere un script en bash que realice el build de una imagen de docker y que luego haga un push de dicha imagen a Artifact registry con las siguientes características:
        a. Nombre del repositorio de AR: bigbox-image.
        b. Region: europe-west1.
        c. PROJECT_ID: my-bigbox-project .
        d. Nombre de la aplicación: bigbox-backend.

    2. Genere un script en bash que realice un deploy en Cloud Run utilizando la imagen del paso anterior, este deploy tiene que tener las siguientes características:
        a. Puerto: 8000
        b. Region: europe-west1
        c. Allow unauthenticated
        d. Nombre de la aplicación: bigbox-core

    3. Tomando como referencia el apartado 1, agregue a su script los pasos necesarios para poder realizar un taggeo por entorno, por ejemplo:
        a. my-awesome-image-tag:latest-stg
        b. my-awesome-image-tag:latest-prod
        c. My-awesome-image-tag:latest-qa

	Este taggeo debe realizarse utilizando variables de entorno.

Importante: Todos los scripts deben realizarse con variables de entorno para que sean considerados válidos.


Cloud Build:
    1. Realizar una pipeline sencilla de linteo que tenga las siguientes características:
        a. Imagen: Python 3.8
        b. Linter: flake8
        c. Debe instalar utilizando pip requirements.txt
        d. El proyecto funciona correctamente en una Distro Ubuntu 22.04

    2. Realizar una pipeline que permita realizar un backup versionado de una base de datos Postgresql en formato ISO, utilizando como referencia los siguientes datos.
        a. Nombre de la base de datos: bigbox
        b. Usuario: foo
        c. Contraseña: bar
        d. Host: localhost
        e. Port: 5432
        f. Versión de la DB de Postgresql: 13
        g. Nombre de la pipeline: bigbox-backup
		
	Esta pipeline debe generar  un archivo dump.sql con el siguiente formato:
		bigbox_YYYYMMDD_HHMMSS.sql

	Una vez hecho esto agregar la automatización de este backup para ser subido a Cloud Storage para ser guardado en bucket llamado “my-backups”.

    3. Realizar una pipeline que permita restaurar el backup realizado en el paso anterior desde Cloud Storage en una base de datos con las siguientes características:
        a. Nombre de la base de datos: bigbox-restored
        b. Usuario: prod
        c. Contraseña: myVeryStrongPassword
        d. Host: localhost
        e. Port: 5432
        f. Versión de la DB de Postgresql: 13
        g. Nombre de la pipeline: bigbox-restore-backup

Este pipeline debe traer siempre el último backup realizado y restaurarlo
