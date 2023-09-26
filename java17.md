#Instalación de JAVA 17 en SSOO Linux DEB

1. Abrir una terminal.
2. Importar la clave GPG del repositorio:

```sh
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
```

3. Añadir el repositorio de AdoptOpenJDK:

 ```sh
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
```

4. Actualizar la lista de paquetes disponibles:
 ```sh
sudo apt update
```
5. Instalar Java 17:
```sh
sudo apt install adoptopenjdk-17-hotspot
```
