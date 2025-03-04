#!/bin/bash

# Definir el archivo de entrada y salida
input_file="SAM1.cbl"
output_file="SAM1_adjusted.cbl"

# Procesar el archivo línea por línea
awk '{print substr($0, 7, 66)}' "$input_file" > "$output_file"

echo "Archivo ajustado guardado como $output_file"
