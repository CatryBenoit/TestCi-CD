# language: fr

Fonctionnalité: Consultation du tableau de bord
  En tant que garde forestier
  Je veux visualiser sur un même écran l'état de la forêt
  Afin de savoir rapidement où se situent les risques et les événements récents

  Contexte:
    Étant donné que je suis connecté en tant que garde forestier
    Et que je suis sur la page d'accueil du tableau de bord

  Scénario: Affichage de la carte générale
    Alors je vois la carte du massif avec toutes les stations, caméras et microphones
    Et chaque zone est colorée selon son niveau de risque d'incendie actuel
    Et les alertes en cours sont signalées par une icône sur la carte

  Scénario: Consultation d'une station
    Quand je clique sur la station "ST-04" sur la carte
    Alors je vois ses dernières mesures et sa date de dernière transmission
    Et je peux ouvrir les graphiques d'évolution de chaque grandeur

  Plan du scénario: Choix de la période des graphiques
    Étant donné que j'ai ouvert les graphiques de la station "ST-04"
    Quand je sélectionne la période "<période>"
    Alors les graphiques affichent les mesures de "<période>"

    Exemples:
      | période           |
      | dernières 24 h    |
      | 7 derniers jours  |
      | 30 derniers jours |
      | saison en cours   |

  Scénario: Filtrer les détections
    Quand j'ouvre la galerie des détections
    Et je filtre sur le type "faune" et l'espèce "sanglier"
    Alors seules les observations de sanglier sont affichées, de la plus récente à la plus ancienne

  Scénario: Consulter le risque prévu
    Quand j'ouvre l'onglet "Prévisions"
    Alors je vois pour chaque zone le niveau de risque d'aujourd'hui, de J+1, J+2 et J+3

  Scénario: Utilisation sur tablette en patrouille
    Étant donné que j'utilise une tablette
    Quand j'ouvre le tableau de bord
    Alors l'affichage s'adapte à la taille de l'écran
    Et la carte reste utilisable au doigt

  Scénario: Consultation publique du niveau de risque
    Étant donné que je suis un visiteur sans compte
    Quand j'ouvre la page publique du massif
    Alors je vois le niveau de risque d'incendie du jour pour chaque zone
    Et les éventuelles restrictions d'accès en vigueur
    Mais je ne vois ni les équipements ni les détections
