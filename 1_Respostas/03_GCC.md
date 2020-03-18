Para todas as questões, compile-as com o gcc e execute-as via terminal.

1. Crie um "Olá mundo!" em C.

Código:
```
#include <stdio.h>

int main(){

    printf("Olá mundo!\n");

    return 0;
}
```

No terminal:
```
gcc -o hello_world hello_world.c
./hello_world
```

2. Crie um código em C que pergunta ao usuário o seu nome, e imprime no terminal "Ola " e o nome do usuário. Por exemplo, considerando que o código criado recebeu o nome de 'ola_usuario_1':

```bash
$ ./ola_usuario_1
$ Digite o seu nome: Eu
$ Ola Eu
```

Código:
```
#include <stdio.h>

int main(){

    char nome[10];

    printf("Digite o seu nome: ");
    scanf("%s", nome);
    printf("Olá %s\n", nome);

    return 0;
}
```

No terminal:
```
gcc -o ola_usuario_1 ola_usuario_1.c
./ola_usuario_1
```

3. Apresente os comportamentos do código anterior nos seguintes casos:

(a) Se o usuário insere mais de um nome.
```bash
$ ./ola_usuario_1
$ Digite o seu nome: Eu Mesmo
```

Resultado:
```
$ Digite o seu nome: Eu Mesmo
$ Olá Eu
```

(b) Se o usuário insere mais de um nome entre aspas duplas. Por exemplo:
```bash
$ ./ola_usuario_1
$ Digite o seu nome: "Eu Mesmo"
```

Resultado:
```
$ Digite o seu nome: "Eu mesmo"
$ Olá "Eu
```

(c) Se é usado um pipe. Por exemplo:
```bash
$ echo Eu | ./ola_usuario_1
```

Resultado:
```
$ Digite o seu nome: Olá Eu
```

(d) Se é usado um pipe com mais de um nome. Por exemplo:
```bash
$ echo Eu Mesmo | ./ola_usuario_1
```

Resultado:
```
$ Digite o seu nome: Olá Eu
```

(e) Se é usado um pipe com mais de um nome entre aspas duplas. Por exemplo:
```bash
$ echo "Eu Mesmo" | ./ola_usuario_1
```

Resultado:
```
$ Digite o seu nome: Olá Eu
```

(f) Se é usado o redirecionamento de arquivo. Por exemplo:
```bash
$ echo Ola mundo cruel! > ola.txt
$ ./ola_usuario_1 < ola.txt
```

Resultado:
```
$ Digite o seu nome: Olá Ola
```

4. Crie um código em C que recebe o nome do usuário como um argumento de entrada (usando as variáveis argc e *argv[]), e imprime no terminal "Ola " e o nome do usuário. Por exemplo, considerando que o código criado recebeu o nome de 'ola_usuario_2':

```bash
$ ./ola_usuario_2 Eu
$ Ola Eu
```

Código:
```
#include <stdio.h>

int main(int argc, char **argv){

    if(argc > 1) printf("Ola %s\n", argv[1]);

    return 0;
}
```

5. Apresente os comportamentos do código anterior nos seguintes casos:

(a) Se o usuário insere mais de um nome.
```bash
$ ./ola_usuario_2 Eu Mesmo
```

Resultado:
```
$ ./ola_usuario_2 Eu Mesmo
$ Ola Eu
```

(b) Se o usuário insere mais de um nome entre aspas duplas. Por exemplo:
```bash
$ ./ola_usuario_2 "Eu Mesmo"
```

Resultado:
```
$ ./ola_usuario_2 "Eu Mesmo"
$ Ola Eu Mesmo
```

(c) Se é usado um pipe. Por exemplo:
```bash
$ echo Eu | ./ola_usuario_2
```

Resultado:
```
$ echo Eu | ./ola_usuario_2
--Programa não exibe nada no terminal--
```

(d) Se é usado um pipe com mais de um nome. Por exemplo:
```bash
$ echo Eu Mesmo | ./ola_usuario_2
```

Resultado:
```
$ echo Eu Mesmo | ./ola_usuario_2
--Programa não exibe nada no terminal--
```

(e) Se é usado um pipe com mais de um nome entre aspas duplas. Por exemplo:
```bash
$ echo "Eu Mesmo" | ./ola_usuario_2
```

Resultado:
```
$ echo "Eu Mesmo" | ./ola_usuario_2
--Programa não exibe nada no terminal--
```

(f) Se é usado o redirecionamento de arquivo. Por exemplo:
```bash
$ echo Ola mundo cruel! > ola.txt
$ ./ola_usuario_2 < ola.txt
```

Resultado:
```
$ echo Ola mundo cruel! > ola.txt
$ ./ola_usuario_2 < ola.txt
--Programa não exibe nada no terminal--
```

6. Crie um código em C que faz o mesmo que o código da questão 4, e em seguida imprime no terminal quantos valores de entrada foram fornecidos pelo usuário. Por exemplo, considerando que o código criado recebeu o nome de 'ola_usuario_3':

```bash
$ ./ola_usuario_3 Eu
$ Ola Eu
$ Numero de entradas = 2
```

Código:
```
#include <stdio.h>

int main(int argc, char **argv){

    if(argc > 1){
        printf("Ola %s\n", argv[1]);
        printf("Número de entradas = %d\n", argc);
    }

    return 0;
}
```

7. Crie um código em C que imprime todos os argumentos de entrada fornecidos pelo usuário. Por exemplo, considerando que o código criado recebeu o nome de 'ola_argumentos':

```bash
$ ./ola_argumentos Eu Mesmo e Minha Pessoa
$ Argumentos: Eu Mesmo e Minha Pessoa
```

Código:
```
#include <stdio.h>

int main(int argc, char **argv){

    if(argc > 1){
        printf("Argumentos:");
        for(int i = 1; i < argc; i++) printf(" %s", argv[i]);
        printf("\n");
    }

    return 0;
}
```

8. Crie uma função que retorna a quantidade de caracteres em uma string, usando o seguinte protótipo:
`int Num_Caracs(char *string);` Salve-a em um arquivo separado chamado 'num_caracs.c'. Salve o protótipo em um arquivo chamado 'num_caracs.h'. Compile 'num_caracs.c' para gerar o objeto 'num_caracs.o'.

num_caracs.c
```
#include "num_caracs.h"

int Num_Caracs(char *string){
    return strlen(string);
}
```

num_caracs.h
```
#ifndef NUM_CARACS
#define NUM_CARACS
#include <stdio.h>
#include <string.h>
int Num_Caracs(char *string);
#endif
```

Compilando no terminal
```
gcc -c num_caracs.c -o num_caracs.o
```

9. Re-utilize o objeto criado na questão 8 para criar um código que imprime cada argumento de entrada e a quantidade de caracteres de cada um desses argumentos. Por exemplo, considerando que o código criado recebeu o nome de 'ola_num_caracs_1':

```bash
$ ./ola_num_caracs_1 Eu Mesmo
$ Argumento: ./ola_num_caracs_1 / Numero de caracteres: 18
$ Argumento: Eu / Numero de caracteres: 2
$ Argumento: Mesmo / Numero de caracteres: 5
```

Código
```
#include <stdio.h>
#include <string.h>

#include "num_caracs.h"

int main(int argc, char **argv){

    if(argc > 1){
        for(int i = 0; i < argc; i++){
            printf("Argumento: %s ", argv[i]);
            printf("/ Numero de caracteres: %d\n", Num_Caracs(argv[i]));
        }
    }

    return 0;
}
```

Compilando no terminal
```
gcc -o ola_num_caracs_1 ola_num_caracs.c num_caracs.o -lm
```

10. Crie um Makefile para a questão anterior.

makefile
```
ola_num_caracs: ola_num_caracs.o num_caracs.o
	gcc -o ola_num_caracs_1 ola_num_caracs.o num_caracs.o
ola_num_caracs.o:
	gcc -c ola_num_caracs.c
num_caracs.o: num_caracs.c num_caracs.h
	gcc -c num_caracs.c
```

11. Re-utilize o objeto criado na questão 8 para criar um código que imprime o total de caracteres nos argumentos de entrada. Por exemplo, considerando que o código criado recebeu o nome de 'ola_num_caracs_2':

```bash
$ ./ola_num_caracs_2 Eu Mesmo
$ Total de caracteres de entrada: 25
```

Código
```
#include <stdio.h>
#include <string.h>

#include "num_caracs.h"

int main(int argc, char **argv)
{

    int total_carac = 0;

    if (argc > 1)
    {
        for (int i = 0; i < argc; i++)
        {
            total_carac += Num_Caracs(argv[i]);
        }
        printf("Total de caracteres: %d\n", total_carac);
    }

    return 0;
}
```

12. Crie um Makefile para a questão anterior.

makefile
```
ola_num_caracs_2: ola_num_caracs_2.o num_caracs.o
	gcc -o ola_num_caracs_2 ola_num_caracs_2.o num_caracs.o
ola_num_caracs_2.o:
	gcc -c ola_num_caracs_2.c
num_caracs.o: num_caracs.c num_caracs.h
	gcc -c num_caracs.c
```