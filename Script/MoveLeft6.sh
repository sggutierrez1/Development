#!/bin/bash

# Definir el archivo de entrada y salida
input_file="SAMB.cbl"
output_file="SAMB_adjusted.cbl"

# Procesar el archivo línea por línea
awk '
{
    # Extraer el segmento entre las posiciones 7 y 10
    check_substr = substr($0, 7, 4)
    
    # Ignorar la línea si contiene "****"
    if (check_substr != "****") {
        # Mover la línea 6 espacios a la derecha y truncar hasta el carácter 72
        print "      " substr($0, 1, 66)
    }
}' "$input_file" > "$output_file"

echo "Archivo ajustado guardado como $output_file"
