# language: fr

Fonctionnalité: Détection de départs de fumée à l'image
  En tant que garde forestier
  Je veux être alerté immédiatement si de la fumée apparaît sur une caméra
  Afin d'intervenir ou de prévenir les secours le plus tôt possible

  Contexte:
    Étant donné une caméra "CAM-01" installée sur le point haut "Tour de guet du Mont Rond"
    Et le garde "Marie Durand" est d'astreinte pour la zone surveillée par "CAM-01"

  Scénario: Fumée détectée
    Quand le modèle détecte de la fumée sur une image de "CAM-01" avec une confiance de 88 %
    Alors une alerte "départ de fumée" de niveau critique est créée
    Et l'alerte contient l'image, l'heure, la caméra et la direction de visée
    Et l'alerte indique la vitesse et la direction du vent fournies par Météo-France pour la zone
    Et "Marie Durand" reçoit une notification push et un SMS

  Scénario: Confirmation de l'alerte et transmission au SDIS
    Étant donné une alerte "départ de fumée" en attente de confirmation
    Quand le garde confirme qu'il s'agit d'un départ de feu
    Alors l'alerte passe au statut "confirmée"
    Et le SDIS reçoit l'alerte avec la position GPS et l'image

  Scénario: Fausse alerte
    Étant donné une alerte "départ de fumée" en attente de confirmation
    Quand le garde indique qu'il s'agit de brume matinale
    Alors l'alerte passe au statut "fausse alerte"
    Et l'image est ajoutée au jeu de données d'amélioration du modèle
    Et le SDIS n'est pas prévenu

  Scénario: Alerte non traitée
    Étant donné une alerte "départ de fumée" créée il y a 10 minutes
    Et aucun garde ne l'a prise en charge
    Quand le délai de prise en charge est dépassé
    Alors l'alerte est envoyée au gestionnaire du milieu naturel

  Scénario: Détection répétée sur plusieurs images
    Quand de la fumée est détectée sur 3 images successives de "CAM-01"
    Alors une seule alerte est créée
    Et les images suivantes sont ajoutées à cette alerte

  Scénario: Fumée de faible confiance
    Quand le modèle détecte de la fumée avec une confiance de 40 %
    Alors aucune alerte n'est créée
    Mais la détection est enregistrée pour consultation dans l'historique

  Scénario: Fumée détectée par le capteur de particules fines
    Étant donné que la station "ST-04" mesure habituellement moins de 20 µg/m³ de particules fines
    Quand "ST-04" mesure 150 µg/m³ de particules fines avec une humidité de l'air de 35 %
    Alors une alerte "fumée possible" de niveau élevé est créée pour la zone de "ST-04"
    Et l'alerte indique si une caméra de la zone a aussi détecté de la fumée

  Scénario: Particules fines élevées par temps de brouillard
    Quand "ST-04" mesure 150 µg/m³ de particules fines avec une humidité de l'air de 95 %
    Alors la mesure est enregistrée
    Mais aucune alerte n'est créée car le brouillard fausse le capteur
