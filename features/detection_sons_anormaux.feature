# language: fr

Fonctionnalité: Détection de sons anormaux en forêt
  En tant que garde forestier
  Je veux que les sons captés en forêt soient analysés automatiquement
  Afin de repérer le braconnage, les coupes illégales et les véhicules en zone interdite

  Contexte:
    Étant donné un module audio "MIC-03" installé dans la zone "Vallon des Sources"
    Et le serveur d'analyse multimédia est disponible

  Plan du scénario: Classification d'un son anormal
    Quand le module "MIC-03" envoie un extrait sonore
    Et le modèle reconnaît un son de type "<type de son>" avec une confiance de <confiance> %
    Alors une alerte "<alerte>" de niveau "<niveau>" est créée
    Et l'alerte contient l'extrait sonore, l'heure et la zone

    Exemples:
      | type de son        | confiance | alerte                     | niveau   |
      | coup de feu        | 90        | tir détecté                | critique |
      | tronçonneuse       | 85        | coupe suspecte             | élevé    |
      | moteur de véhicule | 80        | véhicule en zone interdite | moyen    |

  Scénario: Tir pendant la période de chasse autorisée
    Étant donné que la zone "Vallon des Sources" est ouverte à la chasse aujourd'hui de 8h à 17h
    Quand un coup de feu est détecté à 10h30
    Alors l'événement est enregistré dans l'historique
    Mais aucune alerte n'est envoyée

  Scénario: Tir de nuit
    Étant donné que la chasse est interdite la nuit
    Quand un coup de feu est détecté à 23h15
    Alors une alerte "tir détecté" de niveau critique est envoyée au garde d'astreinte

  Scénario: Tronçonneuse dans une parcelle avec coupe autorisée
    Étant donné qu'une coupe est déclarée sur la zone "Vallon des Sources" cette semaine
    Quand une tronçonneuse est détectée en journée
    Alors l'événement est enregistré sans alerte

  Scénario: Reconnaissance d'un cri d'oiseau
    Quand le modèle reconnaît le chant d'une "chouette hulotte"
    Alors une observation sonore "chouette hulotte" est ajoutée au suivi de la faune
    Et aucune alerte n'est créée

  Scénario: Écoute d'un extrait par le garde
    Étant donné une alerte "tir détecté"
    Quand le garde ouvre l'alerte sur le tableau de bord
    Alors il peut écouter l'extrait sonore
    Et il peut marquer l'alerte comme "confirmée" ou "fausse alerte"
