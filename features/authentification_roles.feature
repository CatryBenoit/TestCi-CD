# language: fr


Fonctionnalité: Authentification et rôles des utilisateurs
  En tant qu'administrateur
  Je veux que chaque utilisateur n'accède qu'aux fonctions de son rôle
  Afin de protéger les données sensibles (localisation des espèces protégées, alertes)

  Scénario: Connexion réussie
    Étant donné un compte garde forestier actif "m.durand"
    Quand l'utilisateur se connecte avec un mot de passe correct
    Alors il accède au tableau de bord

  Scénario: Mot de passe incorrect
    Quand l'utilisateur "m.durand" saisit un mot de passe incorrect
    Alors un message "Identifiant ou mot de passe incorrect" s'affiche
    Et l'utilisateur reste sur la page de connexion

  Scénario: Blocage après plusieurs échecs
    Quand l'utilisateur "m.durand" se trompe de mot de passe 5 fois de suite
    Alors le compte est bloqué pendant 15 minutes

  Plan du scénario: Droits selon le rôle
    Étant donné que je suis connecté avec le rôle "<rôle>"
    Alors je <consulter> consulter le tableau de bord
    Et je <alertes> traiter les alertes
    Et je <equipements> gérer les équipements et les seuils
    Et je <comptes> gérer les comptes utilisateurs

    Exemples:
      | rôle            | consulter | alertes | equipements | comptes     |
      | garde forestier | peux      | peux    | ne peux pas | ne peux pas |
      | gestionnaire    | peux      | peux    | peux        | ne peux pas |
      | administrateur  | peux      | peux    | peux        | peux        |

  Scénario: Accès refusé à une page non autorisée
    Étant donné que je suis connecté en tant que garde forestier
    Quand j'essaie d'ouvrir la page "Équipements"
    Alors un message "Accès non autorisé" s'affiche

  Scénario: Déconnexion automatique
    Étant donné que je suis connecté
    Quand je reste inactif pendant 30 minutes
    Alors je suis déconnecté automatiquement
