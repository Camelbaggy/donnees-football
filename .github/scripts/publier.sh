#!/usr/bin/env bash
# Publie championnats/ et etat_championnats.json (fichiers générés) sur main, push robuste (5 essais, rebase -X theirs : nos fichiers l'emportent).
# Usage : publier.sh "message de commit"
set -u
msg=${1:-"chore: championnats (mise à jour automatique)"}
git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"
[ -d championnats ] && git add championnats
[ -f etat_championnats.json ] && git add etat_championnats.json
if git diff --staged --quiet; then
  echo "Aucune modification de championnats/ à publier."
  exit 0
fi
git commit -q -m "$msg"
for essai in 1 2 3 4 5; do
  if git push; then exit 0; fi
  echo "Push refusé (essai $essai/5) : rebase sur origin puis nouvelle tentative"
  sleep $(( (RANDOM % 16) + 5 ))
  git pull --rebase -X theirs origin main || { git rebase --abort 2>/dev/null; true; }
done
echo "::error::Échec du push après 5 essais"
exit 1
