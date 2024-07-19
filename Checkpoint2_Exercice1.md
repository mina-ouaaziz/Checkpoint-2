Q.1.1 le ping ne fonctionne pas du serveur vers le client. 
!(https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Capture%20d'écran%202024-07-19%20091721.png)

Cependant après avoir changé l'adresse IP du client le ping fonctionne parfaitement.
![https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Capture%20d'écran%202024-07-19%20092320.png]

Q.1.2 Le ping avec le nom du poste client fonctionne.

Q.1.3 Le protocole IPv6 a bien été désactivé sur le poste client en faisant le ping cela fonctionne aussi
Comme sur la photo j'ai fait obtenir une nouvelle adresse IP comme le DHCP et déja configuré
![https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Ping%20WinServ.png]

Une nouvelle adresse IP est active donc le ping fonctionne.
![https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Capture%20d'écran%202024-07-19%20093526.png]

Q.1.4 Changement des config réseaux pour mettre en place le DHCP
![https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Modif%20IP.png]
![https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Ping%20fonctionnel%20client.png]


Q.1.5 Le client peut ne pas récupérer la première adresse disponible pour plusieurs raisons :

Réservation d'Adresse : L'adresse peut être réservée pour un autre appareil spécifique.
Paramètres de Portée DHCP : La configuration de l'étendue DHCP peut spécifier que certaines adresses sont exclues ou réservées pour des raisons spécifiques.
Conflit d'Adresse : L'adresse peut être déjà utilisée par un autre appareil ou en conflit.
Délai d'Attribution : Le serveur DHCP peut utiliser une politique d'attribution non séquentielle pour équilibrer les adresses.

Capture d'écran

Q.1.6 Modification sur le DHCP pour que le Client ait l'Adresse IP 172.16.10.15
Ajouter une Réservation d'Adresse :

Ouvrez la console DHCP sur le serveur.
Sous l'étendue configurée, faites un clic droit sur "Réservations" et sélectionnez "Nouvelle réservation".
Entrez l'adresse IP 172.16.10.15, l'adresse MAC du client, et un nom descriptif.
Cliquez sur "Ajouter" pour enregistrer la réservation.
Vérifiez la Configuration :
![https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/CLIENT1%20DHCP%20RESERVATION.png]

Assurez-vous que la réservation est correctement configurée et que le client est configuré pour obtenir une adresse IP via DHCP.
![https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Ping%20Client%20DHCP.png]

Q.1.7 L'IPv6 offre un espace d'adresses beaucoup plus grand, éliminant le besoin de NAT et am"liore également la sécurité et l'optimisation du routage. 

Q.1.8 Non il ne l'est pas.
Concernant l'IPv6, le serveur DHCP doit être configuré pour DHCPv6, qui est différent du DHCP traditionnel (IPv4).
pour la Configuration du DHCPv6 : on doit ajouter un rôle ou une fonctionnalité DHCPv6 sur le serveur pour qu'il puisse gérer les adresses IPv6. Il faut également s'assurer que les paramètres appropriés sont configurés pour attribuer des adresses IPv6 aux clients.


