#!/bin/bash
set -e

HISTORY=""
FILES=(
~/.zsh_history
~/.bash_history
~/.fishd_history )

LOG=""

for FILE in "${FILES[@]}"
do
  FILE="$(echo -e "${FILE}" | tr -d '[:space:]')"
  if [ -f "$FILE" ]; then
    CONTENT=`cat $FILE`
    LOG="$LOG$CONTENT"
    HISTORY="$HISTORY
$FILE:
$CONTENT
"
  fi
done

LINES=`echo "$LOG" | wc -l`
SESSIONS=`who`

BODY="
Commands run since last: $LINES

Current sessions:
${SESSIONS}

History:
${HISTORY}
"

PROTECTED=`echo "$BODY" | gpg --encrypt -r morten@olsen.pro --armor`
mail -S "Logs for ${whoami} on ${hostname}" "morten@olsen.pro" "$BODY"
for FILE in "${FILES[@]}"
do
  FILE="$(echo -e "${FILE}" | tr -d '[:space:]')"
  if [ -f "$FILE" ]; then
    cat /dev/null > "$FILE"
  fi
done