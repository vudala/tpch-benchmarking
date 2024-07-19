

for i in $(seq 22); do
    ./qgen queries/$i > results/$i.sql

done