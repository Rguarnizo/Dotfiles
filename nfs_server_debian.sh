#!/bin/bash
# Script: setup-nfs-server.sh
# Uso: sudo ./setup-nfs-server.sh /ruta/a/compartir "192.168.1.0/24(rw,sync,no_subtree_check)"

SHARE_DIR=$1
EXPORT_RULE="*(rw,sync,no_subtree_check)"

if [ -z "$SHARE_DIR" ] || [ -z "$EXPORT_RULE" ]; then
    echo "Uso: $0 <DIRECTORIO_A_COMPARTIR> <REGLA_EXPORT>"
    echo "Ejemplo:"
    echo "  sudo $0 /srv/nfs/roms '192.168.1.0/24(rw,sync,no_subtree_check)'"
    exit 1
fi

echo "📦 Instalando NFS server..."
apt update && apt install -y nfs-kernel-server

echo "📂 Creando carpeta compartida en $SHARE_DIR ..."
mkdir -p $SHARE_DIR
chown nobody:nogroup $SHARE_DIR
chmod 755 $SHARE_DIR

echo "📝 Configurando /etc/exports ..."
EXPORTS_LINE="$SHARE_DIR $EXPORT_RULE"
if ! grep -qF "$EXPORTS_LINE" /etc/exports; then
    echo "$EXPORTS_LINE" >> /etc/exports
else
    echo "⚠️ La regla ya existe en /etc/exports"
fi

echo "🔄 Reiniciando servicio NFS..."
exportfs -ra
systemctl enable --now nfs-kernel-server

echo "✅ Servidor NFS configurado correctamente"
echo "📡 Directorio compartido: $SHARE_DIR"
echo "🔑 Regla: $EXPORT_RULE"
echo
echo "👉 Para verificar usa: showmount -e $(hostname -I | awk '{print $1}')"
