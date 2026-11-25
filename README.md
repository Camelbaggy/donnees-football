# Données football (championnats nationaux)

Données **générées** du dashboard [Coupes d'Europe](https://camelbaggy.github.io/coupes-europe/) pour les championnats
nationaux (Ligue 1, Premier League, Liga, Serie A, Bundesliga), servies par GitHub Pages et lues par la page.

- `championnats/<ligue>/<saison>/<AAAA-MM-JJ>.json` : matchs du jour (déroulé, compos, statistiques, xG, momentum, notes),
  classement ; `index.json` : jours de la saison ; `journees.json` : numéros de journée (Wikipédia).
- Ligues : `fl1` Ligue 1, `pl` Premier League, `liga` Liga, `sa` Serie A, `bl` Bundesliga ; saison « 2026-27 ».

Sources : ESPN (données Opta) pour les matchs, statistiques et classements ; Wikipédia (CC BY-SA 4.0) pour les numéros
de journée. Le code et la documentation sont dans [Camelbaggy/coupes-europe](https://github.com/Camelbaggy/coupes-europe).
