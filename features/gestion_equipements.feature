# language: fr

Fonctionnalité: Gestion des équipements de terrain
  En tant que gestionnaire du milieu naturel
  Je veux ajouter, configurer et suivre les stations, caméras et microphones
  Afin de garder un réseau de surveillance à jour et fonctionnel

  Contexte:
    Étant donné que je suis connecté en tant que gestionnaire
    Et que je suis sur la page "Équipements"

  Scénario: Ajouter une station de mesure
    Quand j'ajoute un équipement avec les informations suivantes :
      | champ       | valeur            |
      | type        | station de mesure |
      | identifiant | ST-06             |
      | zone        | Bois des Crêtes   |
      | latitude    | 47.2381           |
      | longitude   | 6.0243            |
      | fréquence   | 15 minutes        |
    Alors la station "ST-06" apparaît dans la liste et sur la carte
    Et ses mesures sont acceptées dès sa première transmission

  Scénario: Identifiant déjà utilisé
    Étant donné que la station "ST-04" existe déjà
    Quand j'ajoute un équipement avec l'identifiant "ST-04"
    Alors un message d'erreur indique que l'identifiant est déjà utilisé
    Et l'équipement n'est pas créé

  Scénario: Modifier la fréquence d'envoi
    Quand je règle la fréquence d'envoi de "ST-04" sur 5 minutes
    Alors la nouvelle fréquence est enregistrée pour "ST-04"
    Et la station la récupère en interrogeant le serveur lors de sa prochaine connexion

  Scénario: Mettre un équipement en maintenance
    Quand je passe la caméra "CAM-02" en mode "maintenance"
    Alors ses images ne sont plus analysées
    Et aucune alerte technique "hors ligne" n'est créée pour "CAM-02"

  Scénario: Mise à jour à distance du micro-contrôleur
    Étant donné qu'une nouvelle version du programme des stations est disponible
    Quand je lance la mise à jour de "ST-04"
    Alors la station apprend qu'une mise à jour l'attend lors de sa prochaine requête au serveur
    Et elle télécharge et installe la nouvelle version
    Et sa fiche affiche le nouveau numéro de version

  Scénario: Supprimer un équipement
    Quand je supprime la station "ST-05"
    Alors elle n'apparaît plus sur la carte
    Mais ses mesures passées restent disponibles dans l'historique
