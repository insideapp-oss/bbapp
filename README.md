# BbApp 🏀

Un projet d'exemple complet d'application iOS/macOS/visionOS SwiftUI pour afficher les informations de matchs de basketball français (Betclic Elite).

## 📋 Description

Ce projet est un **code starter** utilisé lors des formations IA. Il démontre les meilleures pratiques de développement SwiftUI moderne avec :

- Architecture MV (Model-View)
- Composants UI réutilisables et modulaires
- Gestion des données avec Codable et extensions
- Thème complet avec couleurs, typographie et espacement
- Support multiplateforme (iOS, macOS, visionOS)
- Accessibilité intégrée
- Tests et previews complètes

## 🎯 Objectif pédagogique

Ce projet sert de base pour les exercices pratiques lors des formations IA. Il illustre :

- L'organisation modulaire du code
- Les patterns de conception SwiftUI
- La séparation des responsabilités
- Les bonnes pratiques de développement iOS
- L'utilisation des APIs modernes Swift (Swift Concurrency, etc.)

## 🏗️ Architecture

### Structure du projet

```
BbApp/
├── BbAppApp.swift          # Point d'entrée de l'application
├── Model/                  # Modèles de données
│   ├── API/               # Modèles API (Game, Team, Competition, etc.)
│   ├── Extensions/        # Extensions utilitaires
│   └── Tab.swift          # Modèle pour la navigation par onglets
├── Views/                 # Vues principales
├── Components/            # Composants UI réutilisables
│   ├── Game/             # Composants liés aux matchs
│   └── Team/             # Composants liés aux équipes
├── Theme/                 # Système de design
│   ├── Colors.swift       # Palette de couleurs
│   ├── Typography.swift   # Styles de texte
│   ├── Spacing.swift      # Système d'espacement
│   └── CornerRadius.swift # Rayons de coin
├── Resources/             # Assets et ressources
└── Utils/                 # Utilitaires
```

### Patterns utilisés

- **MV** : Architecture Model-View simplifiée adaptée à SwiftUI
- **Protocol-Oriented Programming** : Utilisation intensive des protocoles
- **Value Types** : Préférence pour les structs plutôt que les classes
- **Composition** : Vues construites par composition de composants plus petits

## 🛠️ Technologies

- **Swift 5.0+**
- **SwiftUI** (iOS 17+)
- **Xcode 15+**
- **Multiplateforme** : iOS, macOS, visionOS
- **Swift Concurrency** (async/await)

## 🚀 Installation

### Prérequis

- macOS 14+
- Xcode 15+
- iOS 17+ / macOS 14+ / visionOS 1+

### Installation

1. Clonez ce repository :
  ```bash
   git clone https://github.com/insideapp-fr/bbapp.git
   cd bbapp
  ```
2. Ouvrez le projet dans Xcode :
  ```bash
   open BbApp.xcodeproj
  ```
3. Sélectionnez une cible (iOS Simulator, macOS, ou visionOS) et lancez l'application avec `Cmd + R`.

## 📱 Fonctionnalités

- ✅ **Guide de style** (#1) - Système de design complet (couleurs, typographie, espacement)
- ✅ **Logo d'équipe** (#5) - Composant `TeamLogo` avec gestion des tailles
- ✅ **Logos locaux** (#6) - Assets des équipes Betclic Elite
- ✅ **Carte de match en vedette** (#4) - Composant `FeaturedGameCard` pour les temps forts
- ✅ **Carte de match** (#7) - Composant `GameCard` avec scores et vainqueurs
- 🔄 **Configuration de navigation** (#2) - Système de navigation entre écrans
- 🔄 **Connexion API** (#3) - Intégration avec l'API des données de basket
- ⭕ **Écran d'accueil** (#8) - Page principale avec contenu dynamique
- ⭕ **Écran des matchs** (#9) - Calendrier et résultats des rencontres
- ⭕ **Écran des classements** (#10) - Classement des équipes du championnat
- ⭕ **Gestion des favoris** - Sauvegarde des équipes et matchs préférés
- ⭕ **Mode hors ligne** - Cache local des données pour utilisation sans réseau
- ⭕ **Notifications push** - Alertes pour les matchs importants

## 🎨 Design System

### Couleurs principales

- **Rouge primaire** (`#DA2F16`) : Actions principales, boutons
- **Or tertiaire** (`#D4AB37`) : Accents, éléments spéciaux
- **Gris** : Hiérarchie de texte et arrière-plans subtils

### Typographie

- **Police** : Montserrat (Regular, SemiBold, Bold)
- **Hiérarchie** : 6 tailles de texte prédéfinies
- **Support Dynamic Type** : Adaptation automatique aux préférences utilisateur

### Composants clés

- `GameCard` : Carte compacte pour afficher un match
- `TeamView` : Affichage d'une équipe avec logo
- `VenueBarView` : Barre d'information de lieu
- `ScoreView` : Affichage stylisé d'un score

## 📚 Utilisation pédagogique

### Exercices suggérés

1. **Extension des composants**
  - Ajouter de nouveaux états visuels
  - Créer des variantes de cartes
2. **Intégration API**
  - Implémenter la récupération de données réelles
  - Gestion des erreurs réseau
3. **Écrans principaux**
  - Implémenter l'écran d'accueil (#8)
  - Créer l'écran des matchs (#9)
  - Développer l'écran des classements (#10)
  - Configurer le système de navigation (#2)
4. **Persistance**
  - Ajouter des favoris
  - Cache local des données
5. **Tests**
  - Tests unitaires des modèles et logique métier
  - Tests d'interface utilisateur

## 🤝 Contribution

Ce projet est un exemple pédagogique. Pour les contributions :

1. Fork le projet
2. Créez une branche feature (`git checkout -b feature/nouvelle-fonctionnalite`)
3. Committez vos changements (`git commit -m 'Ajout de nouvelle fonctionnalité'`)
4. Push vers la branche (`git push origin feature/nouvelle-fonctionnalite`)
5. Ouvrez une Pull Request

## 📄 Licence

Ce projet est fourni à des fins pédagogiques. Voir le fichier LICENSE pour plus de détails.

## 👥 Auteurs

- L'équipe Inside App - Développement initial

## 🙏 Remerciements

- Apple pour SwiftUI et les frameworks modernes
- La communauté Swift pour les meilleures pratiques
- Les équipes pédagogiques pour les retours constructifs

## 📋 Backlog du projet

Le développement suit un backlog structuré disponible sur [GitHub Issues](https://github.com/insideapp-fr/bbapp/issues). Chaque fonctionnalité fait l'objet d'une issue dédiée avec :

- Description détaillée des exigences
- Critères d'acceptation
- Étiquettes pour la catégorisation (Feature/Task)
- Suivi du statut d'implémentation

---

*Ce projet fait partie du programme de formation IA et est régulièrement mis à jour avec les dernières bonnes pratiques iOS.*