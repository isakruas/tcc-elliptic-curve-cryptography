#!/bin/bash

M_Ax=4
M_Ay=5

echo "M_A = ($M_Ax, $M_Ay)"

d_A=9
d_A_i=B

echo "d_A = $d_A"
 
H_A=$(./ecutils -ec -ec-define \
    -ec-define-p "B" \
    -ec-define-a "1" \
    -ec-define-b "1" \
    -ec-trapdoor \
    -ec-trapdoor-k "$d_A" \
    -ec-trapdoor-gx "$M_Ax" \
    -ec-trapdoor-gy "$M_Ay")

H_Ax=$(echo "$H_A" | cut -d' ' -f1)
H_Ay=$(echo "$H_A" | cut -d' ' -f2)

echo "H_A = ($H_Ax, $H_Ay)"

d_B=5
d_B_i=3

echo "d_B = $d_B"

H_B=$(./ecutils -ec -ec-define \
    -ec-define-p "B" \
    -ec-define-a "1" \
    -ec-define-b "1" \
    -ec-trapdoor \
    -ec-trapdoor-k "$d_B" \
    -ec-trapdoor-gx "$H_Ax" \
    -ec-trapdoor-gy "$H_Ay")

H_Bx=$(echo "$H_B" | cut -d' ' -f1)
H_By=$(echo "$H_B" | cut -d' ' -f2)

echo "H_B = ($H_Bx, $H_By)"

echo "d_A_i = $d_A_i"
S_A=$(./ecutils -ec -ec-define \
    -ec-define-p "B" \
    -ec-define-a "1" \
    -ec-define-b "1" \
    -ec-trapdoor \
    -ec-trapdoor-k "$d_A_i" \
    -ec-trapdoor-gx "$H_Bx" \
    -ec-trapdoor-gy "$H_By")

S_Ax=$(echo "$S_A" | cut -d' ' -f1)
S_Ay=$(echo "$S_A" | cut -d' ' -f2)

echo "S_A = ($S_Ax, $S_Ay)"

echo "d_B_i = $d_B_i"
M_A_2=$(./ecutils -ec -ec-define \
    -ec-define-p "B" \
    -ec-define-a "1" \
    -ec-define-b "1" \
    -ec-trapdoor \
    -ec-trapdoor-k "$d_B_i" \
    -ec-trapdoor-gx "$S_Ax" \
    -ec-trapdoor-gy "$S_Ay")

M_A_2x=$(echo "$M_A_2" | cut -d' ' -f1)
M_A_2y=$(echo "$M_A_2" | cut -d' ' -f2)

echo "M_A = ($M_A_2x, $M_A_2y)"
