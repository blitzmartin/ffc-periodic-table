#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

$PSQL "TRUNCATE TABLE properties RESTART IDENTITY;"

VALUES=(
"1,1.008,-259.1,-252.9,2"
"2,4.0026,-272.2,-269,2"
"3,6.94,180.54,1342,1"
"4,9.0122,1287,2470,1"
"5,10.81,2075,4000,3"
"6,12.011,3550,4027,2"
"7,14.007,-210.1,-195.8,2"
"8,15.999,-218,-183,2"
"9,18.998,-220,-188.1,2"
"10,20.18,-248.6,-246.1,2"
)

INSERT(){
  $($PSQL "INSERT INTO properties(atomic_number,atomic_mass,melting_point_celsius,boiling_point_celsius,type_id) VALUES($1)")
}
for i in ${!VALUES[@]}
do
  echo ${VALUES[i]}
  INSERT ${VALUES[i]}
  # echo ${VALUES[i]} | while IFS="," read ATOMIC_NUMBER TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
  #  do
  #   echo $ATOMIC_MASS
  #   INSERT $ATOMIC_NUMBER $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT $TYPE_ID
  #  done
done
