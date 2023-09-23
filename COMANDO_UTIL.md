# Comando lsof
```text
lsof (list open files) es una herramienta de administración que muestra información sobre los archivos abiertos por los procesos en ejecución. También puedes usarlo para mostrar los puertos abiertos:
```

```sh
sudo lsof -i -P -n | grep LISTEN
```
    -i selecciona la lista de archivos de Internet y/o IP.
    -P inhibe la conversión de los números de puerto a nombres de puerto.
    -n inhibe la conversión de los números de red a nombres de host.

Ejemplo:

```txt
lsof -i -P -n | grep LISTEN
systemd-r  614 systemd-resolve   14u  IPv4  20083      0t0  TCP 127.0.0.53:53 (LISTEN)
cupsd      762            root    6u  IPv6  19162      0t0  TCP [::1]:631 (LISTEN)
cupsd      762            root    7u  IPv4  19163      0t0  TCP 127.0.0.1:631 (LISTEN)
mariadbd   838           mysql   20u  IPv4  21236      0t0  TCP 127.0.0.1:3306 (LISTEN)
squid     1155           proxy   12u  IPv6  22600      0t0  TCP *:3128 (LISTEN)
java      5917             oem   41u  IPv6  76561      0t0  TCP *:8080 (LISTEN)
java      5917             oem   49u  IPv6  76568      0t0  TCP 127.0.0.1:8005 (LISTEN)
java      6232             oem  125u  IPv6  77622      0t0  TCP *:42041 (LISTEN)
```
# Salida del Comando

    Primera Columna: Command
        Indica el nombre del comando (programa) que ha abierto el puerto.
    Segunda Columna: PID
        Muestra el ID del proceso (Process ID) que está utilizando el puerto.
    Tercera Columna: User
        Indica el nombre del usuario bajo el cual se está ejecutando el proceso.
    Cuarta Columna: FD
        Representa el descriptor de archivo (File Descriptor) que está asociado con el socket.
    Quinta Columna: Type
        Muestra el tipo de protocolo (IPv4 o IPv6).
    Sexta Columna: Device
        Indica el número de dispositivo, usualmente no es relevante en este contexto.
    Séptima Columna: Size/Off
        Normalmente muestra el tamaño del archivo, pero en el contexto de los sockets, generalmente será 0t0.
    Octava y Novena Columna: Node and Name
        Indica la dirección IP y el número de puerto en el que el proceso está escuchando. Si ves un asterisco *, significa que está escuchando en todas las interfaces de red disponibles.

# Desglose de la Salida

    systemd-resolve
        Escuchando en 127.0.0.53:53 TCP (IPv4) – probablemente un servidor DNS local.

    cupsd
        Escuchando en 127.0.0.1:631 y [::1]:631 TCP – es el servidor de impresión CUPS, escuchando en IPv4 e IPv6 local.

    mariadbd
        Escuchando en 127.0.0.1:3306 TCP (IPv4) – es un servidor MariaDB (MySQL) escuchando solo en localhost.

    squid
        Escuchando en *:3128 TCP (IPv6) – es un servidor proxy Squid, escuchando en todas las interfaces disponibles.

    java
        Varias instancias de Java escuchan en diferentes puertos, por ejemplo, *:8080 TCP (IPv6) y 127.0.0.1:8005 TCP (IPv6).

    java
        Otra instancia de Java escuchando en *:42041 TCP (IPv6).
# Interpretación

La interpretación práctica de esta salida es que tienes varios servicios ejecutándose en tu máquina, cada uno escuchando en diferentes puertos y esperando conexiones entrantes. Algunos de estos servicios están configurados para escuchar solo en la interfaz de bucle invertido (localhost o 127.0.0.1), lo que significa que solo se pueden acceder desde la misma máquina, mientras que otros están escuchando en todas las interfaces de red, lo que significa que se pueden acceder desde cualquier lugar, siempre que no haya un firewall bloqueando el acceso.
