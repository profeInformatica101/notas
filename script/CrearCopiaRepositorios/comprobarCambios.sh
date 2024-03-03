#!/bin/bash

# Directorio raíz que contiene los repositorios Git
ROOT_DIR="/path/to/your/main/repository"

# Fecha desde la cual buscar cambios
SINCE_DATE="1/3/2023"

# Cambiar al directorio raíz
cd $ROOT_DIR

# Recorrer cada subdirectorio
for d in */ ; do
    echo "Revisando cambios en el directorio $d"
    cd $d

    # Verificar si el subdirectorio es un repositorio Git
    if [ -d ".git" ]; then
        # Mostrar commits desde la fecha especificada
        git log --since="$SINCE_DATE" --pretty=format:"%h - %an, %ar : %s"
    else
        echo "El directorio $d no es un repositorio Git."
    fi

    # Volver al directorio raíz
    cd ..
done
