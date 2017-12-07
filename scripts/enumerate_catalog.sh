#!/bin/sh -l

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --time=24:00:00
#SBATCH --partition=regular
#SBATCH --job-name=enumerate_catalog
#SBATCH --output=enumerate_catalog-%j.out
#SBATCH --error=enumerate_catalog-%j.error
#SBATCH --constraint=haswell

# Load GASpy
. ~/GASpy/scripts/load_env.sh
cd $GASPY_PATH/scripts

# Tell Luigi to do the enumeration
PYTHONPATH=$PYTHONPATH luigi \
    --module tasks EnumerateAlloys \
    --max-index 2 \
    --whitelist '["Pd", "Cu", "Au", "Ag", "Pt", "Rh", "Re", "Ni", "Co", "Ir", "W", "Al", "Ga", "In", "H", "N", "Os", "Fe", "V", "Si", "Sn", "Sb", "Mo", "Mn", "Cr", "Ti", "Zn", "Ge", "As", "Se", "Ru", "Pb", "S"]' \
    --scheduler-host $luigi_port \
    --workers=32 \
    --log-level=WARNING \
    --parallel-scheduling \
    --worker-timeout 300