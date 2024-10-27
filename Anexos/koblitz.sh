#!/bin/bash

M_1="Matematica"

echo -n "M_1 = {"

for ((i=0; i<${#M_1}; i++)); do
    echo -n "${M_1:i:1}" 
    if [ $i -lt $((${#M_1}-1)) ]; then
        echo -n ", " 
    fi
done

echo "}" 

echo -n "A_1 = {"

for ((i=0; i<${#M_1}; i++)); do
    echo -n "$(printf "%d" "'${M_1:i:1}'")"
    if [ $i -lt $((${#M_1}-1)) ]; then
        echo -n ", "
    fi
done

echo "}"

P=$(./ecutils -eck -eck-ec-get "secp192r1" \
    -eck-encode \
    -eck-encoding-type "ascii" \
    -eck-encode-message "$M_1")

J=$(echo "$P" | cut -d' ' -f3)

J_decimal=$(echo "ibase=16; $J" | bc)

echo "J = $J_decimal"

Px=$(echo "$P" | cut -d' ' -f1)
Py=$(echo "$P" | cut -d' ' -f2)

Px_decimal=$(echo "ibase=16; $Px" | bc)
Py_decimal=$(echo "ibase=16; $Py" | bc)

echo "P = ($Px_decimal, $Py_decimal)"

M_2=$(./ecutils -eck -eck-ec-get "secp192r1" \
    -eck-decode \
    -eck-encoding-type "ascii" \
    -eck-decode-px "$Px" \
    -eck-decode-py "$Py" \
    -eck-decode-j "$J"
)

echo -n "A_2 = {"

for ((i=0; i<${#M_2}; i++)); do
    echo -n "$(printf "%d" "'${M_2:i:1}'")"
    if [ $i -lt $((${#M_2}-1)) ]; then
        echo -n ", "
    fi
done

echo "}"

echo -n "M_2 = {"

for ((i=0; i<${#M_2}; i++)); do
    echo -n "${M_2:i:1}" 
    if [ $i -lt $((${#M_2}-1)) ]; then
        echo -n ", " 
    fi
done

echo "}" 
