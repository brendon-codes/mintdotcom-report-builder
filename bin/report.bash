#!/bin/bash

## Build report
cat <<EOF | sqlite3 build/db/main.db
.mode csv
.headers ON
.output out/expenses.csv
SELECT
    SUM(t.amount) Amount,
    t.category Category
FROM transactions t
GROUP BY Category;
EOF

