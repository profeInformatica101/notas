#!/bin/bash

# Directorio raíz que contiene los repositorios Git
ROOT_DIR="/home/ehko/Documentos/copiadeseguridad/API_Alumnos"

# Fecha desde la cual buscar cambios (en formato ISO)
SINCE_DATE="2024-02-29"

# Cambiar al directorio raíz
cd "$ROOT_DIR" || exit

# Recorrer cada subdirectorio
for d in */; do
    if [ -d "$d/.git" ]; then
       # echo "Revisando cambios en el directorio $d"
        cd "$d" || exit
        
        # Verificar si hay cambios desde la fecha especificada
        if git log --since="$SINCE_DATE" --exit-code &> /dev/null; then
            echo "$d ha realizado cambios desde el $SINCE_DATE"
        fi
        
        cd ..
    fi
done
