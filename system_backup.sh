#!/bin/bash
#
# Automatische back-up van Raspberry Pi
#
# Gebruik: system_backup.sh {pad} {retentie dagen}
#
# Onderstaande regels zijn bedoelt om de standaard waardes aan te geven,
# voor als er geen command line argumenten worden opgegeven.
# Het script zal onderstaande naamgeving gebruiken:
#
# {$HOSTNAME}.{YYYYmmdd}.img
#
# Wanneer het script oudere back-ups verwijderd, gebaseerd op de retentie,
# Dan zal het alleen bestanden verwijderen met de eigen $HOSTNAME
#
# Back-up wordt gemaakt met dd
# dd is een command-line utilitie voor Linux om bestanden te kopiëren
#

# Declareren van variabelen en standaard waarden
backup_path=/mnt/backup
retention_days=3

# Controleren of we gebruiker root zijn!
if [[ ! $(whoami) =~ "root" ]]; then
echo ""
echo "*****************************************"
echo "*** Dit script moet draaien als root! ***"
echo "*****************************************"
echo ""
exit
fi

# Controleren of er command line argumenten gebruikt zijn
if [ ! -z $1 ]; then
   backup_path=$1
fi

if [ ! -z $2 ]; then
   retention_days=$2
fi

# Maak een trigger om de consistentie van het bestandssysteem te controleren als het image gerestored is
touch /boot/forcefsck

# Back-up maken
dd if=/dev/mmcblk0 of=$backup_path/$HOSTNAME.$(date +%Y%m%d).img bs=4M

# Trigger fsck verwijderen
rm /boot/forcefsck

# Oude back-ups verwijderen
find $backup_path/$HOSTNAME.*.img -mtime +$retention_days -type f -delete 
