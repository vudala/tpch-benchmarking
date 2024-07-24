#!/bin/bash

service postgresql start

echo Setting up database...

pushd dbgen/generated_data > /dev/null
for F in $(ls); do
    sed 's/.$//' $F > aux.tbl
    cp aux.tbl $F
done
rm aux.tbl
popd > /dev/null

psql -a -f schema.sql
psql -a -f load_data.sql

echo All done!

sleep infinity