# language: fr

Fonctionnalité: Collecte des mesures environnementales
  En tant que gestionnaire du milieu naturel
  Je veux que les stations de terrain envoient automatiquement leurs mesures
  Afin de disposer en continu de l'état de l'air dans le massif

  Contexte:
    Étant donné une station "ST-04" installée dans la zone "Bois des Crêtes"
    Et la station "ST-04" est enregistrée et active dans le système

  Scénario: Réception d'une mesure valide
    Quand la station "ST-04" envoie une requête de mesures au serveur de centralisation contenant :
      | grandeur                  | valeur | unité |
      | température de l'air      | 29.0   | °C    |
      | humidité de l'air         | 32     | %     |
      | particules fines PM2.5    | 12     | µg/m³ |
    Alors le serveur de centralisation répond "OK" à la station
    Et la mesure est transmise à l'API puis enregistrée en base avec l'horodatage et la position de la station
    Et la dernière valeur de chaque grandeur est mise à jour sur le tableau de bord

  Scénario: Rejet d'une valeur incohérente
    Quand la station "ST-04" envoie une humidité de l'air de 140 %
    Alors le serveur répond "ERR valeur hors plage" à la station
    Et la valeur est marquée comme invalide
    Et elle n'est pas prise en compte dans le calcul de l'indice de risque
    Et une anomalie "valeur hors plage" est signalée sur la fiche de la station

  Scénario: Requête d'une station inconnue
    Quand une station "ST-99" non enregistrée envoie des mesures
    Alors le serveur répond "ERR station inconnue"
    Et les mesures ne sont pas enregistrées
    Et l'événement est journalisé pour l'administrateur

  Scénario: Station hors ligne
    Étant donné que la station "ST-04" envoie une mesure toutes les 15 minutes
    Quand aucune requête n'est reçue de "ST-04" pendant 1 heure
    Alors la station "ST-04" passe à l'état "hors ligne"
    Et une alerte technique est envoyée au gestionnaire
