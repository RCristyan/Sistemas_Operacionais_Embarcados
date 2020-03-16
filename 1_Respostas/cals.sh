#!/bin/bash

# Tentei outras abordagens mais eficientes mas nenhuma funcionou :(

modulo=$(($#%2))
if [ $modulo -eq 1 ]; then # argumentos impares
     echo informe os argumentos no formato MES1 ANO1 MES2 ANO2 ... MESn ANOn

elif [ $# -eq 2 ]; then
    cal $1 $2

elif [ $# -eq 4 ]; then
    cal $1 $2
    cal $3 $4

elif [ $# -eq 6 ]; then
    cal $1 $2
    cal $3 $4
    cal $5 $6

elif [ $# -eq 8 ]; then
    cal $1 $2
    cal $3 $4
    cal $5 $6
    cal $7 $8

elif [ $# -eq 10 ]; then
    cal $1 $2
    cal $3 $4
    cal $5 $6
    cal $7 $8
    cal $9 $10

elif [ $# -eq 12 ]; then
    cal $1 $2
    cal $3 $4
    cal $5 $6
    cal $7 $8
    cal $9 $10
    cal $11 $12

elif [ $# -eq 14 ]; then
    cal $1 $2
    cal $3 $4
    cal $5 $6
    cal $7 $8
    cal $9 $10
    cal $11 $12
    cal $13 $14

elif [ $# -eq 16 ]; then
    cal $1 $2
    cal $3 $4
    cal $5 $6
    cal $7 $8
    cal $9 $10
    cal $11 $12
    cal $13 $14
    cal $15 $16

elif [ $# -eq 18 ]; then
    cal $1 $2
    cal $3 $4
    cal $5 $6
    cal $7 $8
    cal $9 $10
    cal $11 $12
    cal $13 $14
    cal $15 $16
    cal $17 $18

elif [ $# -eq 20 ]; then
    cal $1 $2
    cal $3 $4
    cal $5 $6
    cal $7 $8
    cal $9 $10
    cal $11 $12
    cal $13 $14
    cal $15 $16
    cal $17 $18
    cal $19 $20
fi
