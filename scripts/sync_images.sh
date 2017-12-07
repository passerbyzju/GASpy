#!/bin/sh -l

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=01:00:00
#SBATCH --partition=regular
#SBATCH --job-name=defuse_lost_runs
#SBATCH --output=defuse_lost_runs-%j.out
#SBATCH --error=defuse_lost_runs-%j.error
#SBATCH --constraint=haswell

# Load GASpy
. ~/GASpy/scripts/load_env.sh
cd $GASPY_PATH/scripts

# Sync the pictures
aws s3 sync $SCRATCH/GASpy_DB/images/adsorption s3://catalyst-thumbnails/
aws s3 sync $SCRATCH/GASpy_DB/images/catalog s3://catalyst-thumbnails/
