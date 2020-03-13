Para todas as questões, escreva os comandos correspondentes no terminal.

1. Escreva o texto "Ola mundo cruel!" em um arquivo denominado "Ola_mundo.txt". Apresente o conteúdo deste arquivo no terminal.<br /><br />
    echo "Ola mundo cruel!" > Ola_mundo.txt<br />
    cat Ola_mundo.txt

2. Apresente o nome de todos os arquivos e pastas na pasta 'root'.<br /><br />
    ls /root/

3. Apresente o tipo de todos os arquivos e pastas na pasta 'root'.<br /><br />
    file /root/

4. Apresente somente as pastas dentro da pasta 'root'.<br /><br />
    ls -l /root/ | grep '^d'

5. Descubra em que dia da semana caiu o seu aniversário nos últimos dez anos.<br /><br />
    for year in 2019 2018 2017 2016 2015 2014 2013 2012 2011 2010 2009; do cal -d $year-08; done


Para as questões a seguir, use a pasta no endereço https://github.com/DiogoCaetanoGarcia/Sistemas_Embarcados/raw/master/Questoes/02_Intro_Linux_arqs.zip

6. Liste somente os arquivos com extensão .txt.<br /><br />
ls -l | grep .txt

7. Liste somente os arquivos com extensão .png.<br /><br />
ls -l | grep .png

8. Liste somente os arquivos com extensão .jpg.<br /><br />
ls -l | grep .jpg

9. Liste somente os arquivos com extensão .gif.<br /><br />
ls -l | grep .gif

10. Liste somente os arquivos que contenham o nome 'cal'.<br /><br />
ls -l | grep cal

11. Liste somente os arquivos que contenham o nome 'tux'.<br /><br />
ls -l | grep tux

12. Liste somente os arquivos que comecem com o nome 'tux'.<br /><br />
ls -l | grep tux*
