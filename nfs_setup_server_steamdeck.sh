#!/bin/bash

# Script para crear un servidor NFS en Steam Deck (SteamOS / Arch-based)
# Compatible con clientes Linux, macOS y Windows
# Ruben & ChatGPT 🚀

set -e

echo "=== Servidor NFS en Steam Deck ==="

# 1. Verificar si se ejecuta como root
if [[ $EUID -ne 0 ]]; then
  echo "Por favor ejecuta este script como root (sudo $0)"
  exit 1
fi

# 2. Instalar NFS si no está presente
if ! command -v exportfs &> /dev/null; then
  echo "Instalando servidor NFS..."
  pacman -Sy --noconfirm nfs-utils
fi

# 3. Pedir la carpeta a exportar
read -p "Ruta de la carpeta a exportar por NFS: " NFSPATH

# Si no existe, preguntar si se crea
if [ ! -d "$NFSPATH" ]; then
  read -p "La carpeta no existe. ¿Quieres crearla? (s/n): " RESP
  if [[ "$RESP" == "s" || "$RESP" == "S" ]]; then
    mkdir -p "$NFSPATH"
  else
    echo "Carpeta inválida. Abortando."
    exit 1
  fi
fi

# 4. Ajustar permisos (propietario = deck:deck)
chown deck:deck "$NFSPATH"
chmod 755 "$NFSPATH"

# 5. Añadir configuración en /etc/exports
EXPORT_LINE="$NFSPATH *(rw,sync,no_subtree_check,all_squash,anonuid=1000,anongid=1000)"

if ! grep -q "$NFSPATH" /etc/exports; then
  echo "Agregando exportación a /etc/exports..."
  echo "$EXPORT_LINE" >> /etc/exports
else
  echo "La carpeta ya está configurada en /etc/exports"
fi

# 6. Habilitar y arrancar servicios NFS
echo "Habilitando servicios NFS..."
systemctl enable --now nfs-server
systemctl restart nfs-server

# 7. Exportar cambios
exportfs -ra

echo "✅ Servidor NFS configurado correctamente."
echo " Carpeta exportada: $NFSPATH"
echo " Opciones: $EXPORT_LINE"
echo
echo "Para verificar las exportaciones disponibles:"
echo "   showmount -e $(hostname -I | awk '{print $1}')"
 