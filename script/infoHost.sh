#!/bin/bash

echo "Información del Sistema"

# Información de la CPU
echo "CPU:"
lscpu | grep "Model name"
echo ""

# Memoria Total (convertida a MB)
echo "Memoria Total:"
memTotal_kB=$(grep MemTotal /proc/meminfo | awk '{print $2}')
memTotal_MB=$((memTotal_kB / 1024))
echo "${memTotal_MB} MB"
echo ""

# Módulos de Memoria
echo "Módulos de Memoria:"
dmidecode --type memory | grep -E "Size:|Type:"
echo ""

# Información del Disco Duro
echo "Discos Duros:"
lsblk -o NAME,TYPE,SIZE
echo ""

# Tipo de Disco Duro (HDD/SSD)
echo "Tipo de Disco Duro:"
for disk in $(lsblk -d -n -l -o NAME | grep -E '^sd|^hd|^nvme')
do
    echo "Disco: $disk"
    if [ $(cat /sys/block/$disk/queue/rotational) -eq 1 ]; then
        echo "Tipo: HDD"
    else
        echo "Tipo: SSD"
    fi
done
# Información de la Placa Base
echo "Placa Base:"
dmidecode --type baseboard | grep -E "Manufacturer|Product Name|Version"
echo ""
