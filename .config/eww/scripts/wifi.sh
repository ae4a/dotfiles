#!/bin/bash

# Best way I found to get connected network name(problems is that name is not required to be one word)
update_wifi () {
  eww update connectedNetwork=$(nmcli c show --active | grep wifi | sed 's/ \+\w\w\w\w\w\w\w\w-\w\w\w\w-.*//g')
}

update_wifi

# TEST
nmcli monitor | grep Connectivity | while read line; do
  update_wifi
done
