
# Instalar TP-Link AC600 en Linux Mint

## Actualizar el Sistema
- Ejecuta en la terminal:
  ```
  sudo apt update
  sudo apt upgrade
  ```

## Instalar Dependencias
- Instala los paquetes necesarios:
  ```
  sudo apt install bc module-assistant build-essential dkms git
  ```

## Descargar y Compilar el Controlador
- Clona el repositorio y compílalo:
  ```
  git clone https://github.com/aircrack-ng/rtl8812au.git
  cd rtl8812au
  sudo make dkms_install
  ```

## Cargar el Módulo del Controlador
- Carga el módulo:
  ```
  sudo modprobe 8812au
  ```

## Verificar la Instalación
- Verifica con:
  ```
  iwconfig
  ```

## Configurar la Conexión WiFi
- Configura tu conexión WiFi a través del administrador de redes de Linux Mint.

# Instalar TP-Link AC600 en Raspberry Pi

## Actualizar el Sistema de la Raspberry Pi
- Actualiza el sistema operativo:
  ```
  sudo apt update
  sudo apt upgrade
  ```

## Instalar Dependencias
- Instala las herramientas necesarias:
  ```
  sudo apt install bc build-essential dkms git
  ```

## Descargar y Compilar el Controlador
- Clona el repositorio y ajusta la compilación para ARM:
  ```
  git clone https://github.com/aircrack-ng/rtl8812au.git
  cd rtl8812au
  sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/' Makefile
  sed -i 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/' Makefile
  sudo make dkms_install
  ```

## Cargar el Módulo del Controlador
- Carga el módulo en el sistema:
  ```
  sudo modprobe 8812au
  ```

## Verificar la Instalación
- Verifica con:
  ```
  iwconfig
  ```

## Configuración de la Red
- Configura tu red WiFi en la Raspberry Pi.

## Reiniciar si es Necesario
- Reinicia tu Raspberry Pi si encuentras problemas.
