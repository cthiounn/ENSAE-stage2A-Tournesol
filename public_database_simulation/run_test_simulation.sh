#!/bin/sh

STARTING_DUMP=$1
NUMBER_ITERATION=$2
SCRIPT_SHOOT=$3
DATE=$(date '+%Y%m%d')

for i in 1 2 3 4 5; 
do python script_sample.py sample_${NUMBER_ITERATION}_${DATE}_$i.txt ${NUMBER_ITERATION} && PGPASSWORD="password" pg_restore --clean -h localhost -p 5432 -U tournesol -d tournesol -v -Fc ${STARTING_DUMP} && sh ${SCRIPT_SHOOT} sample_${NUMBER_ITERATION}_${DATE}_$i.txt | tee logtir_${NUMBER_ITERATION}_${DATE}_$i.log && pg_dump -h localhost  -p 5432 -d tournesol -U tournesol -Fc > tournesol_posttir_${NUMBER_ITERATION}_${DATE}_$i.Fc && python manage.py ml_train && pg_dump -h localhost  -p 5432 -d tournesol -U tournesol -Fc > tournesol_posttir_mehestan_${NUMBER_ITERATION}_${DATE}_$i.Fc ;
done ;