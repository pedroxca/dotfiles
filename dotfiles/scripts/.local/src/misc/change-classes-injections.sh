#!/usr/bin/env bash




declare -A classes

# find . -type f -path *.java  | xargs  grep "public class" | awk -F ':' ' { print $2 } ' | awk -F ' ' ' { print $3 } '

for dir in $(fd -H -t f -g '*Resource*.java' --exclude '*Test.java' ); do
  path=$(cat "$dir" | grep "public class" | awk -F ' ' ' { print $3 } ')
  classes["$dir"]="$path"
done


declare -A line_path





for path in "${!classes[@]}";do

  # echo "Path: ${classes["$class"]}"


  # grep -n -A 1 "@Inject" $path
  full_line=$(rg  -n '\s+private\s+Logger\s+log;' $path)
  line_number="$(echo $full_line | awk -F ':' ' { print $1 } ')"





  if [[ $line_number != "" ]]; then
    line_path["$path"]="$line_number"
  fi

done
echo "" > classes.txt
for path in "${!line_path[@]}"; do

  line_number_to_change="${line_path["$path"]}"
  class_name="${classes["$path"]}"

  echo "" >> classes.txt
  echo "Class: $path" >> classes.txt
  echo "Line to change: $line_number_to_change" >> classes.txt
  echo "Class name: $class_name" >> classes.txt

  echo "" >> classes.txt
  echo "" >> classes.txt

  sed -n "$(((${line_number_to_change} - 1)))p" $path >> classes.txt
  sed -n "${line_number_to_change}p" $path >> classes.txt
  echo "" >> classes.txt
  echo "" >> classes.txt

  sed -i "$(((${line_number_to_change} - 1)))c\ " $path >> classes.txt
  sed -i "${line_number_to_change}c\private Logger log = LoggerFactory.getLogger($class_name.class);" $path >> classes.txt

  sed -i '11a\
import br.com.bb.iib.shade.org.slf4j.LoggerFactory;' $path

  code $path
done
