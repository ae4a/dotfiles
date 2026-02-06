#!/bin/bash

# Let it be a notation to have a '-prod' at the end of prod ssh hostname

CMD="$(ps -t $1 -o args= | tail -n 1)"
DEST="$(echo "$CMD" | awk '{print $NF}')"


if [[ $CMD == ssh* && $DEST == *-prod ]]; then
  echo "#[fg=#16161D,bg=#e82424,bold] PROD $(echo $DEST | sed 's/-prod//') #[bg=#16161D,fg=#44445D,none]"
fi
