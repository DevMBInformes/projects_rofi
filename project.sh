#!/bin/bash


# Define la ruta base del directorio
base_dir="<tu directorio>" #modificar adonde este tu carpeta con proyectos

# Obtén el directorio seleccionado desde Rofi
selected_dir=$(ls "$base_dir" | rofi -dmenu -i -levenshtein-sort )


# Si no se ha seleccionado ningún directorio, salimos
if [ -z "$selected_dir" ]; then
    exit
fi

# Comprueba si el directorio seleccionado es un directorio válido
if [ ! -d "$base_dir/$selected_dir" ]; then
    echo "Error: No es un directorio válido" >&2
    exit 1
fi

# Cambia al directorio seleccionado
cd "$base_dir/$selected_dir"

# Obtén la subcarpeta seleccionada desde Rofi
selected_subdir=$(ls -d */ | rofi -dmenu -i -levenshtein-sort )

# Si no se ha seleccionado ninguna subcarpeta, terminamos el programa
if [ -z "$selected_subdir" ]; then
    exit
else
    # Si se ha seleccionado una subcarpeta, cambiamos al directorio seleccionado y abrimos nvim
    cd "$selected_subdir"
    nvim
    #opcion para abrir con visual studio code, descomentar la siguiente linea
    #code "$selected_subdir"
fi

