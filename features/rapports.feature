# language: fr

Fonctionnalité: Rapports périodiques
  En tant que gestionnaire du milieu naturel
  Je veux recevoir des synthèses régulières de l'activité du massif
  Afin de suivre les tendances et de justifier les actions de gestion

  Contexte:
    Étant donné que je suis connecté en tant que gestionnaire

  Scénario: Rapport hebdomadaire automatique
    Quand une nouvelle semaine commence
    Alors un rapport de la semaine écoulée est généré automatiquement
    Et il contient l'évolution du niveau de risque par zone, les alertes et les espèces observées
    Et il est envoyé par e-mail aux gestionnaires

  Scénario: Rapport sur une période choisie
    Quand je demande un rapport du 1er juillet au 31 août pour la zone "Bois des Crêtes"
    Alors un rapport limité à cette zone et à cette période est généré
    Et je peux le télécharger au format PDF

  Scénario: Export des données brutes
    Quand j'exporte les mesures de la station "ST-04" du mois dernier
    Alors je télécharge un fichier CSV avec une ligne par mesure horodatée

  Scénario: Inventaire de la faune
    Quand je génère l'inventaire de la faune de l'année
    Alors je vois pour chaque espèce le nombre d'observations confirmées et les zones de présence
    Et les observations "à vérifier" ne sont pas comptées

  Scénario: Période sans données
    Quand je demande un rapport sur une période où aucune donnée n'a été collectée
    Alors un message indique qu'aucune donnée n'est disponible pour cette période
