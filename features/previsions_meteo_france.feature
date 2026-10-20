# language: fr

Fonctionnalité: Intégration des prévisions de Météo-France
  En tant que gestionnaire du milieu naturel
  Je veux que les prévisions météo soient récupérées automatiquement pour chaque zone
  Afin d'anticiper l'évolution du risque d'incendie dans les jours à venir

  Contexte:
    Étant donné que les zones surveillées "Bois des Crêtes" et "Combe Noire" sont définies avec leurs coordonnées
    Et une clé d'accès valide à l'API de Météo-France est configurée

  Scénario: Récupération horaire des prévisions
    Quand la tâche planifiée de récupération s'exécute
    Alors les prévisions de température, d'humidité, de vent et de pluie sont récupérées pour chaque zone
    Et elles couvrent les 72 prochaines heures
    Et elles sont enregistrées en base avec la date de récupération

  Scénario: Récupération des observations de pluie et de vent
    Quand la tâche planifiée de récupération s'exécute
    Alors le cumul de pluie sur les dernières 24 h et le vent observé sont récupérés pour chaque zone
    Et il est utilisé pour le calcul de l'Indice Forêt Météo et du niveau de sécheresse

  Scénario: Mise à jour d'une prévision existante
    Étant donné une prévision déjà enregistrée pour demain 14h sur "Bois des Crêtes"
    Quand une nouvelle prévision est récupérée pour la même échéance
    Alors la nouvelle valeur remplace l'ancienne
    Et l'indice de risque prévu est recalculé

  Scénario: Récupération des vigilances
    Quand Météo-France publie une vigilance "canicule" orange pour le département
    Alors la vigilance est affichée en bandeau sur le tableau de bord

  Scénario: API Météo-France indisponible
    Quand l'API de Météo-France ne répond pas
    Alors le système réessaie 3 fois à 5 minutes d'intervalle
    Et les dernières prévisions disponibles restent utilisées
    Et le tableau de bord indique la date de la dernière prévision reçue

  Scénario: Prévisions trop anciennes
    Étant donné que la dernière prévision reçue date de plus de 12 heures
    Alors une alerte technique est envoyée à l'administrateur
    Et l'indice de risque prévu est affiché comme "non fiable"
