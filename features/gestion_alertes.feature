# language: fr

Fonctionnalité: Gestion et diffusion des alertes
  En tant que gestionnaire du milieu naturel
  Je veux paramétrer qui reçoit quelles alertes et par quel moyen
  Afin que la bonne personne soit prévenue rapidement sans être submergée de notifications

  Contexte:
    Étant donné que je suis connecté en tant que gestionnaire

  Plan du scénario: Canal de notification selon le niveau d'alerte
    Étant donné que une alerte de niveau "<niveau>" est créée
    Alors les destinataires sont prévenus par "<canaux>"

    Exemples:
      | niveau   | canaux                         |
      | critique | SMS, notification push, e-mail |
      | élevé    | notification push, e-mail      |
      | moyen    | notification push              |
      | faible   | tableau de bord seulement      |

  Scénario: Modifier un seuil d'alerte
    Quand je fixe le seuil d'alerte de l'humidité de l'air à 20 % pour la zone "Combe Noire"
    Alors une alerte est créée dès qu'une station de "Combe Noire" mesure une humidité de l'air inférieure à 20 %

  Scénario: Ajouter un destinataire
    Quand j'ajoute "Paul Martin" comme destinataire des alertes de la zone "Combe Noire"
    Alors "Paul Martin" reçoit les prochaines alertes de cette zone

  Scénario: Prise en charge d'une alerte
    Étant donné une alerte "tir détecté" au statut "nouvelle"
    Quand un garde clique sur "Je prends en charge"
    Alors l'alerte passe au statut "en cours" avec le nom du garde
    Et les autres destinataires voient qu'elle est prise en charge

  Scénario: Clôture d'une alerte
    Étant donné une alerte au statut "en cours"
    Quand le garde la clôture avec un commentaire
    Alors l'alerte passe au statut "clôturée"
    Et elle est conservée dans l'historique avec le commentaire

  Scénario: Regroupement des alertes répétées
    Quand 5 alertes de même type sont créées sur la même zone en moins de 15 minutes
    Alors les destinataires reçoivent une seule notification regroupée
