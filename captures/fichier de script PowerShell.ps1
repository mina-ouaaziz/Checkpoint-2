# Vérifier si le script est exécuté avec des privilèges administratifs
If (-not ([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match "S-1-5-32-544")) {
    Write-Host "Ce script doit être exécuté avec des privilèges administratifs." -ForegroundColor Red
    exit
}

Write-Host "--- Début du script ---"

# Importer le module contenant la fonction Log
Import-Module "C:\Scripts\Functions.psm1"

# Fonction pour générer un mot de passe aléatoire
Function Random-Password ($length = 12) {  # Longueur du mot de passe par défaut est de 12 caractères
    $punc = 46..46           # Code ASCII pour les caractères de ponctuation (.) 
    $digits = 48..57         # Code ASCII pour les chiffres (0-9)
    $letters = 65..90 + 97..122  # Code ASCII pour les lettres majuscules (A-Z) et minuscules (a-z)

    # Générer un mot de passe en choisissant des caractères aléatoires parmi les codes spécifiés
    $password = Get-Random -Count $length -InputObject ($punc + $digits + $letters) | `
        ForEach-Object -Begin { $aa = $null } -Process { $aa += [char]$_ } -End { $aa }
    Return $password.ToString()  # Retourner le mot de passe en tant que chaîne de caractères
}

# Fonction pour gérer les accents et convertir les lettres en minuscules
Function ManageAccentsAndCapitalLetters {
    param ([String]$String)
    
    # Remplacer les caractères accentués par leurs équivalents non accentués
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    
    # Convertir la chaîne en minuscules pour normaliser la casse
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    
    # Retourner la chaîne normalisée
    $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

# Vérifier si le fichier CSV et le fichier de log existent
If (-not (Test-Path -Path $CsvFile)) {
    Write-Host "Le fichier CSV spécifié n'existe pas." -ForegroundColor Red
    exit
}

# Importer le fichier CSV en sélectionnant uniquement les colonnes nécessaires pour la création des utilisateurs
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","description" -Encoding UTF8 | Select-Object prenom, nom, description

# Traitement de chaque utilisateur importé
foreach ($User in $Users) {
    # Normaliser le prénom et le nom en supprimant les accents et en convertissant en minuscules
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.nom
    # Créer un nom d'utilisateur complet basé sur le prénom et le nom normalisés
    $Name = "$Prenom.$Nom"

    # Vérifier si l'utilisateur existe déjà
    If (-not (Get-LocalUser -Name $Name -ErrorAction SilentlyContinue)) {
        # Générer un mot de passe aléatoire
        $Pass = Random-Password
        # Convertir le mot de passe en une chaîne sécurisée
        $Password = (ConvertTo-SecureString $Pass -AsPlainText -Force)
        # Préparer la description de l'utilisateur
        $Description = "$($User.description)"
        # Créer les informations de l'utilisateur
        $UserInfo = @{
            Name                 = $Name
            FullName             = $Name
            Password             = $Password
            AccountNeverExpires  = $true   # L'utilisateur ne sera pas désactivé automatiquement
            PasswordNeverExpires = $true   # Le mot de passe ne doit jamais expirer
            Description          = $Description # Utilisation du champ Description
        }

        # Créer le nouvel utilisateur local
        try {
            New-LocalUser @UserInfo
            # Ajouter l'utilisateur au groupe local "Utilisateurs"
            try {
                Add-LocalGroupMember -Group "Utilisateurs" -Member $Name
                # Journaliser l'ajout au groupe
                Log -Message "L'utilisateur $Name a été ajouté au groupe Utilisateurs" -LogLevel "Info"
            } catch {
                # Journaliser l'échec de l'ajout au groupe
                Log -Message "Erreur lors de l'ajout de $Name au groupe Utilisateurs : $_" -LogLevel "Error"
                Write-Host "Erreur lors de l'ajout de $Name au groupe Utilisateurs" -ForegroundColor Red
            }
            
            # Journaliser la création de l'utilisateur
            Log -Message "Le compte $Name a été créé avec le mot de passe $Pass" -LogLevel "Info"

            # Afficher le message de confirmation avec le mot de passe en couleur verte
            Write-Host "Le compte $Name a été créé avec le mot de passe $Pass" -ForegroundColor Green
        } catch {
            Write-Host "Erreur lors de la création de l'utilisateur $Name : $_" -ForegroundColor Red
            Log -Message "Erreur lors de la création de l'utilisateur $Name : $_" -LogLevel "Error"
        }
    } else {
        # Afficher le message d'erreur en couleur rouge si l'utilisateur existe déjà
        Write-Host "Le compte $Name existe déjà" -ForegroundColor Red

        # Journaliser l'existence de l'utilisateur
        Log -Message "Le compte $Name existe déjà" -LogLevel "Warning"
    }
}

Write-Host "--- Fin du script ---"

# Pause jusqu'à ce que l'utilisateur appuie sur Entrée
Read-Host -Prompt "Appuyez sur Entrée pour terminer"