# Effectué en dehors du timing

 ### Q.2.1
J'ai fait un script pour transférer mon dossier Scripts du serveur vers le poste client.
![Script Powershell.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Script%20Powershell.png)
![Scripts dossier client.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Scripts%20dossier%20client.png)

### Q.2.2
Suite à l'ouverture de mon script sur le poste client, une page PowerShell s'ouvre mais se referme. Pour que le script `Main.ps1` soit fonctionnel, nous devons corriger l'emplacement du script `AddLocalUsers.ps1`, car il se trouve dans le dossier Scripts et non dans le dossier Temps.

![Script principal.png](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/Script%20principal.png)

### Q.2.3
Cela lance le processus avec des privilèges d'administrateur.

### Q.2.4
Cela permet de lancer PowerShell en mode maximisé.

### Q.2.5
Le premier utilisateur du fichier `Users.csv` n'est jamais pris en compte parce que le problème viendrait de la mention `skip 2` dans le `Select-Object` qui ignore les deux premières lignes du fichier `user.csv`.

### Q.2.6
 Il n'est pas inclus dans la création de l'utilisateur local.
 
### Q.2.7
J'ai ajouté la commande `Import-Csv` pour inclure que les éléments nécessaires.

### Q.2.8
"Le compte `<Utilisateur>` a été créé avec le mot de passe `<MotDePasse>`" est bien en vert.

### Q.2.9
Les deux façons sont soit d'importer le module au début du script, soit de changer le module dynamiquement.

### Q.2.10
"Le compte `<Utilisateur>` existe déjà" est bien en rouge.

### Q.2.12
Dans le script, la chaîne `"$Prenom.$Nom"` est maintenant remplacée par une variable `$Name`.

### Q.2.13
Les comptes utilisateurs créés ont un mot de passe qui expire.

### Q.2.14
Le mot de passe est maintenant constitué de 12 caractères au lieu de 6.

### Q.2.15
Le délai d'attente de 10 secondes a été ajouté.

### Q.2.16
La fonction `ManageAccentsAndCapitalLetters` sert à supprimer les accents et convertit aussi toutes les lettres en minuscules comme par exemple:
- Prénom original: Anna -> Prénom normalisé: anna
- Nom original: Dumas -> Nom normalisé: dumas
- Nom d'utilisateur complet normalisé: anna.dumas

### Voici mon script corrigé
![fichier de script PowerShell.ps1](https://github.com/mina-ouaaziz/Checkpoint-2/blob/main/captures/fichier%20de%20script%20PowerShell.ps1#L1)
