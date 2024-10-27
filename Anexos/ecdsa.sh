#!/bin/bash

# Parâmetros da curva elíptica
ec_p_hex="5"
ec_p_decimal=$(echo "ibase=16; $ec_p_hex" | bc)

ec_a_hex="1D5D"
ec_a_decimal=$(echo "ibase=16; $ec_a_hex" | bc)

ec_b_hex="3CB"
ec_b_decimal=$(echo "ibase=16; $ec_b_hex" | bc)

ec_gx_hex="0"
ec_gx_decimal=$(echo "ibase=16; $ec_gx_hex" | bc)

ec_gy_hex="1"
ec_gy_decimal=$(echo "ibase=16; $ec_gy_hex" | bc)

ec_n_hex="7"
ec_n_decimal=$(echo "ibase=16; $ec_n_hex" | bc)

ec_h_hex="1"
ec_h_decimal=$(echo "ibase=16; $ec_h_hex" | bc)

# Exibir informações da curva elíptica
echo "Parâmetros da curva elíptica:"
echo "p = $ec_p_decimal"
echo "a = $ec_a_decimal"
echo "b = $ec_b_decimal"
echo "n = $ec_n_decimal"
echo "h = $ec_h_decimal"
echo "G = ($ec_gx_decimal, $ec_gy_decimal)"

# Chave privada e mensagem
d_hex="3"
d_decimal=$(echo "ibase=16; $d_hex" | bc)

M_hex="3C5B"
M_decimal=$(echo "ibase=16; $M_hex" | bc)

# Exibir chave privada e mensagem
echo "Chave privada (d) = $d_decimal"
echo "Mensagem (M) = $M_decimal"

# Gerar chave pública (Q)
Q=$(./ecutils -ecdsa -ecdsa-ec-define \
    -ecdsa-ec-define-p "$ec_p_hex" \
    -ecdsa-ec-define-a "$ec_a_hex" \
    -ecdsa-ec-define-b "$ec_b_hex" \
    -ecdsa-ec-define-gx "$ec_gx_hex" \
    -ecdsa-ec-define-gy "$ec_gy_hex" \
    -ecdsa-ec-define-n "$ec_n_hex" \
    -ecdsa-ec-define-h "$ec_h_hex" \
    -ecdsa-private-key "$d_hex" \
    -ecdsa-get-public-key)

Qx_hex=$(echo "$Q" | cut -d' ' -f1)
Qx_decimal=$(echo "ibase=16; $Qx_hex" | bc)

Qy_hex=$(echo "$Q" | cut -d' ' -f2)
Qy_decimal=$(echo "ibase=16; $Qy_hex" | bc)

# Exibir chave pública (Q)
echo "Chave pública (Q) = ($Qx_decimal, $Qy_decimal)"

# Assinar a mensagem (M)
U=$(./ecutils -ecdsa -ecdsa-ec-define \
    -ecdsa-ec-define-p "$ec_p_hex" \
    -ecdsa-ec-define-a "$ec_a_hex" \
    -ecdsa-ec-define-b "$ec_b_hex" \
    -ecdsa-ec-define-gx "$ec_gx_hex" \
    -ecdsa-ec-define-gy "$ec_gy_hex" \
    -ecdsa-ec-define-n "$ec_n_hex" \
    -ecdsa-ec-define-h "$ec_h_hex" \
    -ecdsa-private-key "$d_hex" \
    -ecdsa-signature \
    -ecdsa-signature-message "$M_hex")

R_hex=$(echo "$U" | cut -d' ' -f1)
R_decimal=$(echo "ibase=16; $R_hex" | bc)

S_hex=$(echo "$U" | cut -d' ' -f2)
S_decimal=$(echo "ibase=16; $S_hex" | bc)

# Exibir assinatura
echo "Assinatura:"
echo "R = $R_decimal"
echo "S = $S_decimal"

# Verificar a assinatura
V=$(./ecutils -ecdsa -ecdsa-ec-define \
    -ecdsa-ec-define-p "$ec_p_hex" \
    -ecdsa-ec-define-a "$ec_a_hex" \
    -ecdsa-ec-define-b "$ec_b_hex" \
    -ecdsa-ec-define-gx "$ec_gx_hex" \
    -ecdsa-ec-define-gy "$ec_gy_hex" \
    -ecdsa-ec-define-n "$ec_n_hex" \
    -ecdsa-ec-define-h "$ec_h_hex" \
    -ecdsa-verify-signature \
    -ecdsa-verify-signature-public-key-px "$Qx_hex" \
    -ecdsa-verify-signature-public-key-py "$Qy_hex" \
    -ecdsa-verify-signature-r "$R_hex" \
    -ecdsa-verify-signature-s "$S_hex" \
    -ecdsa-verify-signature-signed-message "$M_hex")

# Verificar o resultado da verificação e exibir apropriado
if [ "$V" == "1" ]; then
    echo "A assinatura é válida."
else
    echo "A assinatura é inválida."
fi


# Verificar a assinatura
V=$(./ecutils -ecdsa -ecdsa-ec-define \
    -ecdsa-ec-define-p "$ec_p_hex" \
    -ecdsa-ec-define-a "$ec_a_hex" \
    -ecdsa-ec-define-b "$ec_b_hex" \
    -ecdsa-ec-define-gx "$ec_gx_hex" \
    -ecdsa-ec-define-gy "$ec_gy_hex" \
    -ecdsa-ec-define-n "$ec_n_hex" \
    -ecdsa-ec-define-h "$ec_h_hex" \
    -ecdsa-verify-signature \
    -ecdsa-verify-signature-public-key-px "$Qx_hex" \
    -ecdsa-verify-signature-public-key-py "$Qy_hex" \
    -ecdsa-verify-signature-r "$R_hex" \
    -ecdsa-verify-signature-s "$S_hex" \
    -ecdsa-verify-signature-signed-message "$M_hex")

# Verificar o resultado da verificação e exibir apropriado
if [ "$V" == "1" ]; then
    echo "A assinatura é válida."
else
    echo "A assinatura é inválida."
fi
