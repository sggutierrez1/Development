#!/bin/bash

# Este script usa awk para extraer los caracteres de la columna 8 a la 12 
# y descartar las líneas donde ese segmento sea solo espacios en blanco 
# o contenga únicamente números

# Verificar si se proporcionó un archivo como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo="$1"

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "Error: El archivo '$archivo' no existe."
    exit 1
fi

# Filtrar líneas que no contengan solo espacios o números en las columnas 8-12
awk '{
    campo = substr($0, 8, 5);
    if (campo !~ /^[0-9]+$/ && campo !~ /^ *$/) {
        print $0;
    }
}' "$archivo"

# uso 
# chmod +x script.sh
# ./script.sh archivo.txt
#