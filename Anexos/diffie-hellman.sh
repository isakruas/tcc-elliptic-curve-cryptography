#!/bin/bash

Gx=4
Gy=5

echo "G = ($Gx, $Gy)"

d_A=9

echo "d_A = $d_A"

H_A=$(./ecutils -ec -ec-define \
    -ec-define-p "B" \
    -ec-define-a "1" \
    -ec-define-b "1" \
    -ec-trapdoor \
    -ec-trapdoor-k "$d_A" \
    -ec-trapdoor-gx "$Gx" \
    -ec-trapdoor-gy "$Gy")

H_Ax=$(echo "$H_A" | cut -d' ' -f1)
H_Ay=$(echo "$H_A" | cut -d' ' -f2)

echo "H_A = ($H_Ax, $H_Ay)"

d_B=5

echo "d_B = $d_B"
 
H_B=$(./ecutils -ec -ec-define \
    -ec-define-p "B" \
    -ec-define-a "1" \
    -ec-define-b "1" \
    -ec-trapdoor \
    -ec-trapdoor-k "$d_B" \
    -ec-trapdoor-gx "$Gx" \
    -ec-trapdoor-gy "$Gy")

H_Bx=$(echo "$H_B" | cut -d' ' -f1)
H_By=$(echo "$H_B" | cut -d' ' -f2)

echo "H_B = ($H_Bx, $H_By)"

S_A=$(./ecutils -ec -ec-define \
    -ec-define-p "B" \
    -ec-define-a "1" \
    -ec-define-b "1" \
    -ec-trapdoor \
    -ec-trapdoor-k "$d_A" \
    -ec-trapdoor-gx "$H_Bx" \
    -ec-trapdoor-gy "$H_By")

S_Ax=$(echo "$S_A" | cut -d' ' -f1)
S_Ay=$(echo "$S_A" | cut -d' ' -f2)

echo "S_A = ($S_Ax, $S_Ay) : S_A = d_A * H_B"

S_B=$(./ecutils -ec -ec-define \
    -ec-define-p "B" \
    -ec-define-a "1" \
    -ec-define-b "1" \
    -ec-trapdoor \
    -ec-trapdoor-k "$d_B" \
    -ec-trapdoor-gx "$H_Ax" \
    -ec-trapdoor-gy "$H_Ay")

S_Bx=$(echo "$S_B" | cut -d' ' -f1)
S_By=$(echo "$S_B" | cut -d' ' -f2)

echo "S_B = ($S_Bx, $S_By) : S_B = d_B * H_A"
