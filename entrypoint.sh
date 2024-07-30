#!/bin/bash

service postgresql start

echo Setting up database...

psql -a -f schema.sql
psql -a -f keys.sql
psql -a -f indexes.sql
psql -a -f load_data.sql

echo All done!

sleep infinity