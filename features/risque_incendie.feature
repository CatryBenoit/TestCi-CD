# language: fr

Fonctionnalité: Évaluation de la sécheresse et du risque d'incendie
  En tant que gestionnaire du milieu naturel
  Je veux connaître le niveau de sécheresse et le risque d'incendie actuel et prévu de chaque zone
  Afin de déclencher des mesures préventives avant un départ de feu

  Contexte:
    Étant donné la zone "Bois des Crêtes" équipée des stations "ST-04" et "ST-05"
    Et des mesures récentes sont disponibles pour ces stations
    Et des prévisions Météo-France sont disponibles pour les 72 prochaines heures

  Plan du scénario: Calcul du niveau de risque à partir de l'indice
    Quand l'Indice Forêt Météo calculé pour la zone vaut <IFM>
    Alors le niveau de risque affiché est "<niveau>"
    Et la zone apparaît en "<couleur>" sur la carte

    Exemples:
      | IFM | niveau       | couleur |
      | 3   | faible       | vert    |
      | 12  | modéré       | jaune   |
      | 25  | élevé        | orange  |
      | 45  | très élevé   | rouge   |
      | 70  | exceptionnel | violet  |

  Scénario: Évaluation du niveau de sécheresse
    Étant donné un cumul de pluie observé par Météo-France de 2 mm sur les 30 derniers jours
    Et une humidité de l'air restée sous 30 % pendant les 7 derniers jours
    Quand le niveau de sécheresse est calculé
    Alors la zone est classée en "sécheresse sévère"

  Scénario: Prévision du risque à court terme
    Quand le modèle de prévision s'exécute
    Alors un niveau de risque est estimé pour J+1, J+2 et J+3
    Et chaque estimation est affichée avec son niveau de confiance

  Scénario: Alerte préventive
    Étant donné que le risque prévu pour demain sur "Bois des Crêtes" est "très élevé"
    Quand la prévision est calculée
    Alors une alerte préventive est envoyée au gestionnaire et aux gardes de la zone
    Et l'alerte recommande de renforcer les patrouilles et d'envisager une restriction d'accès au massif

  Scénario: Pas de nouvelle alerte si le niveau ne change pas
    Étant donné qu'une alerte préventive "très élevé" a déjà été envoyée pour demain
    Quand la prévision est recalculée avec le même niveau
    Alors aucune nouvelle alerte n'est envoyée

  Scénario: Baisse du risque
    Étant donné une alerte préventive en cours sur "Bois des Crêtes"
    Quand le risque prévu redescend au niveau "modéré" après un épisode pluvieux
    Alors l'alerte préventive est clôturée
    Et les destinataires sont informés de la levée de l'alerte

  Scénario: Données de terrain insuffisantes
    Étant donné que les stations "ST-04" et "ST-05" sont hors ligne
    Quand l'indice de risque est calculé
    Alors le calcul utilise uniquement les données de Météo-France
    Et le niveau de risque est affiché avec la mention "estimation sans données terrain"
