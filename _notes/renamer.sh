#!/bin/bash

# Funktion zum Ersetzen von Leerzeichen durch Unterstriche in Dateinamen
rename_files() {
  for file in "$1"/*; do
    # Überprüfen, ob der Dateiname Leerzeichen enthält
    if [[ "$file" == *" "* ]]; then
      # Ersetzen von Leerzeichen durch Unterstriche
      new_file="${file// /_}"
      mv "$file" "$new_file"
      file="$new_file"
    fi

    # Wenn das Element ein Verzeichnis ist, rekursiv aufrufen
    if [ -d "$file" ]; then
      rename_files "$file"
    fi
  done
}

# Startverzeichnis (hier können Sie den Pfad zum gewünschten Verzeichnis angeben)
start_dir="/home/mrpetrisan/Schreibtisch/Comptia"

# Aufruf der Funktion
rename_files "$start_dir"
