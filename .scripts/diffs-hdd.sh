find "$1" -type f | sed -e "s#$1##g" | sort -u > /tmp/hdd1
find "$2" -type f | sed -e "s#$2##g" | sort -u > /tmp/hdd2
diff -u /tmp/hdd1 /tmp/hdd2 > /tmp/hdd.diff
