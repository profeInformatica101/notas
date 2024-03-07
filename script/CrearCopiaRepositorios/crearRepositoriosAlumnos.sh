#!/bin/bash

# Definir el nombre del directorio principal
dir_principal="API_Alumnos"

# Crear el directorio principal si no existe
mkdir -p "$dir_principal"
cd "$dir_principal"

# Inicializar repositorio Git en el directorio principal
git init

# Ruta al archivo CSV
archivo_csv="../github.csv"

# Leer archivo CSV, ignorando la primera línea
tail -n +2 "$archivo_csv" | while IFS=',' read -r idea repo_url
do
  # Quitar comillas y espacios adicionales
  repo_url=$(echo $repo_url | tr -d '"' | tr -d ' ')

  # Comprobar si la URL no está vacía
  if [[ -n $repo_url ]]
  then
    # Crear directorio con el nombre de usuario IDEA y entrar en él
    mkdir -p "$idea"
    cd "$idea"

    # Clonar el repositorio de GitHub
    git clone "$repo_url" .
    git config --global --add safe.directory "$(git rev-parse --show-toplevel)"
	
    # Volver al directorio principal
    cd ..
  else
    echo "El usuario $idea no tiene una URL de repositorio."
  fi
done

git config --global user.name "Pablo"
git config --global user.email "jdommay863@g.educaand.es"

# Agregar todos los cambios al repositorio principal
git add .

# Hacer commit en el repositorio principal
git commit -m "Agregados proyectos de alumnos"

# Volver al directorio principal
cd ..

echo "Todos los repositorios válidos han sido clonados."
echo "El repositorio API_Alumnos ha sido inicializado y está listo para ser subido a un repositorio remoto."
sh comprueba.sh


