#!/usr/bin/bash

# $1 logs location
# $2 location to store parsed files

set -x
set -e

cat $1/pg_stat_activity-*.log | awk {'print $2'} | sort | uniq -c | awk {'print $2"\t"$1'} > $2/connections.tsv 
sed -i "1s/^/date\tcount\n&/" $2/connections.tsv