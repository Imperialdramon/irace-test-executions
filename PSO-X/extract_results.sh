#!/bin/bash

# Crear las carpetas de destino si no existen
mkdir -p Data/{BH,BL,BH-65,BL-32}

# Array con los nombres de los escenarios
scenarios=("BH" "BL" "BH-65" "BL-32")

# Recorrer cada escenario
for scenario in "${scenarios[@]}"; do
    # Buscar todas las carpetas de ejecución para el escenario actual
    find "PSO-X/Scenarios/$scenario/Runs" -type d -name "${scenario}_seed_*" | while read -r run_dir; do
        # Extraer el número de semilla del nombre de la carpeta
        seed=$(echo "$run_dir" | grep -o '[0-9]\+$')
        
        # Ruta del archivo irace.Rdata original
        source_file="$run_dir/Results/irace.Rdata"
        
        # Ruta de destino para el archivo renombrado
        dest_file="Data/$scenario/$seed.Rdata"
        
        # Copiar el archivo si existe
        if [ -f "$source_file" ]; then
            cp "$source_file" "$dest_file"
            echo "Copiado: $source_file -> $dest_file"
        else
            echo "Advertencia: No se encontró $source_file"
        fi
    done
done
