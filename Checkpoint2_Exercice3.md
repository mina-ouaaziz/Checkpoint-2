### Q.3.1
Le matériel réseau A est un switch et son rôle via-à-vis des schémas est de diriger le trafic réseau entre les ordinateurs.

### Q.3.2
Le matériel réseau B est un routeur et son rôle est de diriger le trafic entre les réseaux connectés. Il sert également de routeur par défaut pour le 10.10.0.0/16.

### Q.3.3
f0/0 est l'interface FastEthernet et cela indique le numéro de l'interface, et g1/0 est l'interface GigabitEthernet et cela indique le numéro de l'interface.

### Q.3.4
Le /16 pour l'ordinateur PC2 représente le masque de sous-réseau.

### Q.3.5
Pour cet ordinateur, c'est la passerelle par défaut.

### Q.3.6
- **PC 1**
  - Adresse réseau : 10.10.0.0
  - Première adresse disponible : 10.10.0.1
  - Dernière adresse disponible : 10.10.255.254
  - Adresse de diffusion : 10.10.255.255

- **PC 2**
  - Adresse réseau : 10.11.0.0
  - Première adresse disponible : 10.11.0.1
  - Dernière adresse disponible : 10.11.255.254
  - Adresse de diffusion : 10.11.255.255

- **PC 5**
  - Adresse réseau : 10.10.4.0
  - Première adresse disponible : 10.10.4.1
  - Dernière adresse disponible : 10.10.4.254
  - Adresse de diffusion : 10.10.4.255

### Q.3.7
Les ordinateurs qui vont pouvoir communiquer entre eux sont les PC1, PC2, PC3, PC4 et PC5.

### Q.3.8
Tous les ordinateurs de PC1 à PC5 vont pouvoir atteindre le réseau 172.16.5.0/24.

### Q.3.9
Cela peut provoquer un changement d'adresse IP, problème de routage.

### Q.3.10
Les modifications à faire sont :
- Supprimer la configuration IP statique actuelle
- Vérifier que le serveur DHCP soit activé et configuré.

### Q.3.11
L'adresse MAC 00:50:79:66:68:00 correspond au PC1.

### Q.3.12
Oui, la capture a réussi, entre le PC1 et le PC4.

### Q.3.13
- La commande **request** correspond au PC1 : adresse IP 10.10.4.1, adresse MAC 00:50:79:66:68:00.
- La commande **reply** correspond au PC4 : adresse IP 10.10.4.2, adresse MAC 00:50:79:66:68:03.

### Q.3.14
Le protocole encapsulé correspond au protocole ICMP qui est utilisé pour échanger des messages de contrôle et de diagnostic entre les hôtes d'un réseau.

### Q.3.15
Le matériel A permet de surveiller le trafic réseau et le matériel B facilite la transmission des données.

### Q.3.16
C'est le paquet 2, l'adresse IP est 10.10.80.3 et c'est le PC3.

### Q.3.17
C'est le protocole ICMP qui permet d'échanger des messages de contrôle et de diagnostic entre les hôtes d'un réseau IP.

### Q.3.18
Non, cela a échoué. Le paquet 2 est un ping entre les deux PC, le paquet 3 est une réponse ICMP de type "destination unreachable", le paquet 6 est la même chose que le paquet 3, et le paquet 5 est un ping entre le PC3 et le PC11.

### Q.3.19
- Le paquet 2 a essayé de faire un ping entre le PC 3 et le PC 11 mais cela n'a pas fonctionné.

### Q.3.20
Le rôle des matériels A et B sont :
- Réception et analyse des paquets
- Routage et envoi des paquets
- Gestion du trafic

### Q.3.21
- Matériel source : PC1
  - Adresse IP : 10.10.4.1
- Matériel de destination : PC4
  - Adresse IP : 10.10.4.2

### Q.3.22
- Adresse MAC source : 00:50:79:66:68:00
- Adresse MAC destination : 00:50:79:66:68:03

Ils appartiennent au même réseau, ce qui indique que les deux appareils appartiennent au même réseau et peuvent communiquer directement.

### Q.3.23
Ils sont sur le réseau 10.10.0.0/16.
