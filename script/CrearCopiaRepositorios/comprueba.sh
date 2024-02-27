#!/bin/bash

# Definir el directorio principal que contiene las carpetas de los alumnos
dir_principal="API_Alumnos"

# Cambiar al directorio principal
cd "$dir_principal"

# Imprimir un mensaje si el directorio no existe o no se puede cambiar a él
if [ $? -ne 0 ]; then
    echo "No se pudo acceder al directorio $dir_principal"
    exit 1
fi

# Inicializar un contador para las carpetas vacías
carpetas_vacias=0

# Recorrer cada subcarpeta en el directorio principal
for carpeta in */
do
    # Contar el número de archivos y subcarpetas en la carpeta actual
    num_items=$(ls -A "$carpeta" | wc -l)

    # Verificar si la carpeta está vacía
    if [ $num_items -eq 0 ]; then
        # Incrementar el contador de carpetas vacías
        carpetas_vacias=$((carpetas_vacias + 1))

        # Imprimir el nombre de la carpeta vacía
        echo "Carpeta vacía: ${carpeta%/}"
    fi
done

# Verificar si se encontraron carpetas vacías
if [ $carpetas_vacias -eq 0 ]; then
    echo "Todas las carpetas tienen contenido."
else
    echo "Se encontraron $carpetas_vacias carpetas vacías."
fi

# Volver al directorio original
cd -
