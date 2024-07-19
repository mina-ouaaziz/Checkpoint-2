Q.1.1 le ping ne fonctionne pas du serveur vers le client. 
![Capture d'écran 2024-07-19 091721.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Capture%20d'écran%202024-07-19%20091721.png)

Cependant après avoir changé l'adresse IP du client le ping fonctionne parfaitement.
![Capture d'écran 2024-07-19 092320.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Capture%20d'écran%202024-07-19%20092320.png)

Q.1.2 Le ping avec le nom du poste client fonctionne.

Q.1.3 Le protocole IPv6 a bien été désactivé sur le poste client en faisant le ping cela fonctionne aussi
Comme sur la photo j'ai fait obtenir une nouvelle adresse IP comme le DHCP et déja configuré
![Ping WinServ.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Ping%20WinServ.png)

Une nouvelle adresse IP est active donc le ping fonctionne.
![Capture d'écran 2024-07-19 093526.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Capture%20d'écran%202024-07-19%20093526.png)

Q.1.4 Changement des config réseaux pour mettre en place le DHCP
![Modif IP.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Modif%20IP.png)
![Ping fonctionnel client.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Ping%20fonctionnel%20client.png)

Q.1.5 Le client peut ne pas récupérer la première adresse disponible pour plusieurs raisons ( soit l'adresse est peut être réservée pour un autre appareil, délai d'attrition ou la config DHCP est peut etre spécifier que pour certaines adresses. 

Q.1.6 Pour que l'adresse IP 172.16.10.15 soit celle du client il faut créer une nouvelle réservation d'adresse
Ouvrir la console DHCP sur le serveur.
Sous l'étendue  faire un clic droit sur "Réservations" et sélectionnez "Nouvelle réservation".
Entrez l'adresse IP 172.16.10.15 et l'adresse MAC du client et le nom réservation client1
Cliquez sur "Ajouter" pour enregistrer la réservation.
Vérifiez la Configuration :
![CLIENT1 DHCP RESERVATION.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/CLIENT1%20DHCP%20RESERVATION.png)

Assurez-vous que la réservation est correctement configurée et que le client est configuré pour obtenir une adresse IP via DHCP.
![Ping Client DHCP.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Ping%20Client%20DHCP.png)

Q.1.7 L'IPv6 offre un espace d'adresses beaucoup plus grand, éliminant le besoin de NAT et am"liore également la sécurité et l'optimisation du routage. 

Q.1.8 Non il ne l'est pas.
Concernant l'IPv6, le serveur DHCP doit être configuré pour DHCPv6, qui est différent du DHCP traditionnel (IPv4).
pour la Configuration du DHCPv6 : on doit ajouter un rôle ou une fonctionnalité DHCPv6 sur le serveur pour qu'il puisse gérer les adresses IPv6. Il faut également s'assurer que les paramètres appropriés sont configurés pour attribuer des adresses IPv6 aux clients.


