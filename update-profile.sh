#!/bin/sh

_profile_d_folder_from="./profile.d"
_profile_d_folder_to="/etc/profile.d"

if [ "$UID" -ne "0" ]
then
  echo "Vous devez être root pour exécuter ce script."
  exit

cp -f $_profile_d_folder_from/* $_profile_d_folder_to