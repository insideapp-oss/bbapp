# BbApp — Web Starter

Application web de basket (Betclic Elite) utilisée comme **code starter** pour les formations IA.

Ce projet est le pendant web du starter iOS/SwiftUI. Il suit la même progression pédagogique et le même backlog.

## Technologies

| Rôle | Outil |
|---|---|
| Build | Vite 6 |
| UI | React 19 + TypeScript |
| Styles | Tailwind CSS v4 |
| Routing | React Router v7 |
| Data fetching | TanStack Query v5 |

## Architecture

```
src/
├── types/          # Modèles de données (Game, Team, Competition, Venue…)
├── theme/          # Constantes de thème (spacing)
├── components/
│   ├── game/       # FeaturedGameCard, GameCard, ScoreView, VenueBar, WinnerEdgeStrip
│   ├── team/       # TeamLogo, TeamView
│   └── nav/        # AppBar, TabBar
├── pages/          # HomePage, GamesPage, StandingsPage
├── hooks/          # useGames (template API hook)
└── data/           # mockGames, mockTeams (données de preview)
public/
├── logos/          # Logos des équipes Betclic Elite (PNG)
└── fonts/          # Montserrat Regular, SemiBold, Bold
```

## Design System

- **Rouge primaire** `#DA2F16` — actions, app bar, cartes featured
- **Or tertiaire** `#D4AB37` — accents, pills de temps, strip vainqueur
- **Police** Montserrat (Regular 400, SemiBold 600, Bold 700)
- Tokens définis dans `src/index.css` via `@theme` (Tailwind v4)

## Démarrage

```bash
yarn        # installer les dépendances
yarn dev    # lancer le serveur de développement
yarn build  # build de production
```

## Backlog pédagogique

- ✅ Design system (tokens couleurs, typographie, espacement)
- ✅ Modèles TypeScript (Game, Team, Competition…)
- ✅ Composant TeamLogo (avec fallback initiales)
- ✅ FeaturedGameCard (carte match en vedette)
- ✅ GameCard (carte match compact, modes à venir / passé)
- ✅ Navigation par onglets (Accueil, Matchs, Classement)
- 🔄 Connexion API réelle (hook `useGames`)
- ⭕ Écran d'accueil dynamique
- ⭕ Écran des matchs avec calendrier
- ⭕ Écran classement réel
- ⭕ Favoris (Zustand + localStorage)
- ⭕ Mode hors ligne (cache TanStack Query)
