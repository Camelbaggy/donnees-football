# CLAUDE.md

Dépôt de **données** : `championnats/` (championnats nationaux du dashboard Coupes d'Europe) et `internationales/` (Coupe du monde,
Euro, Ligue des nations, Coupe du monde des clubs, Coupe intercontinentale), servi par GitHub Pages.
Tout est en français (logs, messages de commit).

- Il ne contient que des fichiers JSON générés par les workflows. Le code (`ligues.py`, `journees_wiki.py`,
  `run_ligues.py`), la page et toute la documentation (`CLAUDE.md`, `docs/etude_championnats.md`) sont dans
  Camelbaggy/coupes-europe : y modifier le code, pas ici. Les workflows d'ici prennent le code de `main` (entrée `ref`
  pour essayer une branche) : fusionner là-bas avant de relancer ici.
- **Ne jamais modifier `championnats/` ni `internationales/` à la main** (ni committer de données générées en local) : les workflows sont seuls
  auteurs. Seuls `.github/` et README / CLAUDE.md se modifient ici.
- `collecte_championnats.yml` (dispatch : `date` ou `du` + `au`, `ligues`, `ref`) : `run_ligues.py`, puis
  `.github/scripts/publier.sh` (push robuste, rebase `-X theirs`).
- `battement.yml` (~330 min, se relance) + `veille_secours.yml` (cron :37) : veille de la collecte quotidienne (`veille_ligues.py`), qui
  relance `collecte_championnats.yml -f date=J` ; `etat_championnats.json` (racine) est lu par la veille et par la notification commune.
- `reconstitution_championnats.yml` (dispatch, auto-relance) : jours passés de la saison (`run_ligues.py --reconstituer`), classement recalculé.
- `championnats/clubs/` (fiches de club et de joueur, `fiches_ligues.py`) : régénéré après chaque collecte et chaque reconstitution ;
  `correspondances.json` = clubs ESPN rapprochés d'une fiche UEFA (preuve : un match de coupe commun).
- `.nojekyll` doit rester à la racine (Pages sans Jekyll).
- `reconstitution_internationales.yml` (dispatch : `comp`, `edition`, `ref` ; auto-relance, groupe `internationales`) : éditions récentes des
  compétitions internationales (`run_internationales.py --reconstituer`, liste `EDITIONS` du dépôt de code) -> `internationales/`.
