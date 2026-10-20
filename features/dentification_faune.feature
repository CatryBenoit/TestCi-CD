# language: fr

Fonctionnalité: Identification automatique des espèces animales
  En tant que garde forestier
  Je veux que les images des caméras soient analysées automatiquement
  Afin de suivre la présence de la faune sans visionner toutes les vidéos

  Contexte:
    Étant donné une caméra "CAM-02" installée près d'un point d'eau dans la zone "Combe Noire"
    Et le serveur d'analyse multimédia est disponible

  Scénario: Identification d'une espèce avec une confiance élevée
    Quand le détecteur de mouvement de "CAM-02" déclenche une photo
    Et la photo est envoyée au serveur d'analyse
    Et le modèle reconnaît un "chevreuil" avec une confiance de 92 %
    Alors une observation "chevreuil" est enregistrée avec l'image, la date et la position
    Et l'observation apparaît dans la galerie des détections du tableau de bord

  Scénario: Photo prise par un garde en patrouille
    Étant donné que le garde "Marie Durand" est en patrouille avec l'application mobile
    Quand le garde photographie un animal
    Alors la photo est envoyée au serveur d'analyse avec sa position GPS
    Et l'espèce reconnue s'affiche sur son téléphone
    Et l'observation est enregistrée avec le nom du garde

  Scénario: Identification incertaine à vérifier
    Quand le modèle reconnaît un "lynx" avec une confiance de 55 %
    Alors l'observation est enregistrée avec le statut "à vérifier"
    Et elle apparaît dans la liste des détections à valider par un garde

  Scénario: Validation d'une observation par le garde
    Étant donné une observation "lynx" au statut "à vérifier"
    Quand le garde forestier confirme l'espèce
    Alors l'observation passe au statut "confirmée"
    Et l'image est ajoutée au jeu de données d'amélioration du modèle

  Scénario: Correction d'une erreur d'identification
    Étant donné une observation "renard" au statut "à vérifier"
    Quand le garde forestier corrige l'espèce en "chat forestier"
    Alors l'observation est enregistrée comme "chat forestier"
    Et la correction est conservée pour le réentraînement du modèle

  Scénario: Aucun animal sur l'image
    Quand la caméra envoie une image déclenchée par le vent dans les branches
    Et le modèle ne détecte aucun animal
    Alors aucune observation n'est créée
    Et l'image n'est pas conservée

  Scénario: Signalement d'une espèce protégée
    Étant donné que le "lynx" figure dans la liste des espèces protégées à suivre
    Quand une observation "lynx" est confirmée
    Alors le gestionnaire du milieu naturel reçoit une notification
