# Backup script voor (Raspberry) Pi

Automatische back-up van Raspberry Pi

Gebruik:

`system_backup.sh {pad} {retentie dagen}`

Onderstaande regels zijn bedoelt om de standaard waardes aan te geven,
voor als er geen command line argumenten worden opgegeven.
Het script zal onderstaande naamgeving gebruiken:

`{$HOSTNAME}.{YYYYmmdd}.img`

Wanneer het script oudere back-ups verwijderd, gebaseerd op de retentie,
Dan zal het alleen bestanden verwijderen met de eigen $HOSTNAME

Back-up wordt gemaakt met [dd](http://man7.org/linux/man-pages/man1/dd.1.html)

dd is een command-line utilitie voor Linux om bestanden te kopiëren
