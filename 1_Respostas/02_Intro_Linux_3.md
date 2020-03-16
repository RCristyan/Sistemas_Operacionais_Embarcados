Para todas as questões, escreva os scripts e as chamadas correspondentes no terminal.

1. Crie um arquivo com nome _teste1.txt_, e escreva nele o texto "Número do arquivo = 1". Repita o procedimento para os arquivos _teste2.txt_, _teste3.txt_, ..., _teste100.txt_, escrevendo o texto correspondente para cada um deles ("Número do arquivo = 2", "Número do arquivo = 3", ..., "Número do arquivo = 100").

```
    for i in {1..100}; do echo "Número do arquivo = $i" > teste$i.txt; done
```

2. Faça um script chamado _cals.sh_ que apresente o calendário de vários meses indicados pelo usuário, usando o seguinte formato:

```script
./cals.sh MES1 ANO1 MES2 ANO2 MES3 ANO3
```

Não limite o script a 3 meses. Ele deve funcionar para vários casos, como por exemplo:

```script
./cals.sh 1 2020
./cals.sh 1 2019 2 2020 3 2021 1 2010
```

Resposta:
```
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

```

3. Utilizando a lógica do script anterior, descubra em que dia da semana caiu o seu aniversário nos últimos dez anos.

```
    ./cals.sh 8 2019 8 2018 8 2017 8 2016 8 2015 8 2014 8 2013 8 2012 8 2011 8 2010 8 2009
```

4. Crie um arquivo _sites.txt_ com o seguinte conteúdo:

```
https://github.com/DiogoCaetanoGarcia/Sistemas_Embarcados/raw/master/Aulas/01_Linux%20b%C3%A1sico.pdf
https://github.com/DiogoCaetanoGarcia/Sistemas_Embarcados/raw/master/Aulas/01_Linux%20b%C3%A1sico_Shell_Script.pdf
https://github.com/DiogoCaetanoGarcia/Sistemas_Embarcados/raw/master/Aulas/01_Sistemas%20Embarcados%20-%20Aula%201%20-%20Introdu%C3%A7%C3%A3o.pdf
```

Estes são links para slides de 3 aulas desta dsciplina, um para cada linha do arquivo _sites.txt_. Faça um script que faz o download destes slides automaticamente, a partir do arquivo _sites.txt_. (DICA: use o comando wget.)

Executar no terminal:
```
./site_download.sh < sites.txt
```

Script:
```
#!/bin/bash

read site1
read site2
read site3

wget $site1
wget $site2
wget $site3
```

5. Faça um script chamado _up.sh_ que sobe _N_ níveis na pasta onde você estiver, usando $1 como parâmetro de entrada. Por exemplo, se você estiver em **/home/aluno/Documents** e executar **./up.sh 2**, você automaticamente vai para a pasta **/home**.

Executar no terminal
```
. ./up.sh <argumento>
```
OBS: o comando acima executa o script no mesmo shell, em vez de ser um processo filho

Script:
```
#!/bin/bash

count=0
while [ $count -lt $1 ]
    do
        cd ..
        count=$((count+1))
    done
```