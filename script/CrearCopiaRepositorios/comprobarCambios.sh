#!/bin/bash

# Directorio raíz que contiene los repositorios Git
ROOT_DIR="/home/ehko/Documentos/copiadeseguridad/API_Alumnos"

# Fecha desde la cual buscar cambios (en formato ISO)
# SINCE_DATE se ha cambiado a una fecha válida, ya que 2024 no es un año bisiesto y no tiene 29 de febrero.
SINCE_DATE="2024-02-28"

# Cambiar al directorio raíz
cd "$ROOT_DIR" || exit

# Recorrer cada subdirectorio
for d in */; do
    if [ -d "$d/.git" ]; then
        # echo "Revisando cambios en el directorio $d"
        cd "$d" || exit
        
        # Verificar si hay cambios desde la fecha especificada
        # Se ha cambiado la condición de verificación. La opción `--exit-code` de `git log` no es válida en este contexto.
        # Se utiliza `git log --since="$SINCE_DATE" -1` para intentar obtener al menos un commit desde la fecha especificada.
        # Si se encuentra un commit, entonces se han realizado cambios.
        if git log --since="$SINCE_DATE" -1 > /dev/null; then
            echo "$d ha realizado cambios desde el $SINCE_DATE"
        else
            echo "$d no ha realizado cambios desde el $SINCE_DATE"
        fi
        
        # Regresar al directorio padre
        cd "$ROOT_DIR" || exit
    fi
done
