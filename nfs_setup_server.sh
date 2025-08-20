#!/bin/bash
## Configuración rápida de NFS en Steam Deck para compartir /home/deck/Emulation/roms
#
PC_IP="*"  # <-- Cambia esto por la IP de tu PC con Windows/WSL
#
echo "1. Dando permisos a la carpeta..."
sudo mkdir -p /home/deck/Emulation/roms
sudo chmod -R 777 /home/deck/Emulation/roms
#
echo "2. Instalando NFS si no está instalado..."
sudo pacman -Sy --noconfirm nfs-utils
#
echo "3. Configurando /etc/exports..."
sudo bash -c "cat > /etc/exports <<EOF
/home/deck/Emulation/roms ${PC_IP}(rw,sync,no_subtree_check,no_root_squash,insecure)
/home/deck/Emulation/bios ${PC_IP}(rw,sync,no_subtree_check,no_root_squash,insecure)
EOF"
#
echo "4. Activando servicios NFS..."
sudo systemctl enable --now nfs-server rpcbind nfs-idmapd
#
echo "5. Recargando exportaciones..."
sudo exportfs -ra
sudo exportfs -v
export PATH=$HOME/.local/bin:$PATH
#
echo "6. Configurando firewall..."
sudo firewall-cmd --permanent --add-service=nfs
sudo firewall-cmd --permanent --add-service=mountd
sudo firewall-cmd --permanent --add-service=rpc-bind
sudo firewall-cmd --reload
#
echo "✅ NFS configurado. Ahora desde WSL ejecuta:"
echo "sudo mkdir -p /mnt/roms"
echo "sudo mount -t nfs ${HOSTNAME}:/home/deck/Emulation/roms /mnt/roms"
echo "sudo mount -t nfs ${HOSTNAME}:/home/deck/Emulation/bios /mnt/bios"
#
