#!/bin/bash

## Drop Header Columns
for f in in/months/*.csv; do
    csvtool drop 1 ${f} > build/months/$(basename ${f})
done;

## Combine files
csvtool cat build/months/*.csv > build/summary/full.csv

## Grab only needed columns
csvtool col 4,6 build/summary/full.csv > build/summary/final.csv

## Write to db
cat <<EOF | sqlite3
.mode csv
.read schema/transactions.sql
.import build/summary/final.csv transactions
.backup temp build/db/main.db
.quit
EOF


