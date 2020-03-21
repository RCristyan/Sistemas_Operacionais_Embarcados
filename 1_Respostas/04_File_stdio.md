Para todas as questões, utilize as funções da biblioteca `stdio.h` de leitura e de escrita em arquivo (`fopen()`, `fclose()`, `fwrite()`, `fread()`, dentre outras). Compile os códigos com o gcc e execute-os via terminal.

1. Crie um código em C para escrever "Ola mundo!" em um arquivo chamado 'ola_mundo.txt'.

Código:
```
#include <stdio.h>
#include <stdlib.h>

int main(){

    FILE *fp;
    fp = fopen("ola_mundo.txt", "w");

    if(!fp){
        printf("Erro na abertura do arquivo!\n");
        exit(1);
    }

    char hello[25] = {"Ola mundo!\n"};
    fputs(hello, fp);

    return 0;
}
```

2. Crie um código em C que pergunta ao usuário seu nome e sua idade, e escreve este conteúdo em um arquivo com o seu nome e extensão '.txt'. Por exemplo, considerando que o código criado recebeu o nome de 'ola_usuario_1':

```bash
$ ./ola_usuario_1
$ Digite o seu nome: Eu
$ Digite a sua idade: 30
$ cat Eu.txt
$ Nome: Eu
$ Idade: 30 anos
```

Código:
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){

    char nome[25];
    char idade[2];
    char file_name[30];

    printf("Digite o seu nome: ");
    fgets(nome, 25, stdin);

    strcpy(file_name, nome);

    for (int i = 0;; i++)
    {
        if (file_name[i] == '\n')
        {
            file_name[i] = '\0';
            break;
        }
    }

    strcat(file_name, ".txt");

    FILE *fp;
    fp = fopen(file_name, "w");

    if (!fp)
    {
        printf("Erro na abertura do arquivo!\n");
        exit(1);
    }

    fprintf(fp, "Nome: ");
    fprintf(fp, "%s", nome);

    printf("Digite a sua idade: ");
    scanf("%s", idade);
    fprintf(fp, "Idade: ");
    fprintf(fp, "%s anos", idade);

    fprintf(fp, "\n");
    fclose(fp);

    return 0;
}
```

3. Crie um código em C que recebe o nome do usuário e e sua idade como argumentos de entrada (usando as variáveis `argc` e `*argv[]`), e escreve este conteúdo em um arquivo com o seu nome e extensão '.txt'. Por exemplo, considerando que o código criado recebeu o nome de 'ola_usuario_2':

```bash
$ ./ola_usuario_2 Eu 30
$ cat Eu.txt
$ Nome: Eu
$ Idade: 30 anos
```

Código:
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv)
{

    if (argc != 3)
    {
        printf("Digite 2 argumentos, nome e idade.\n");
        exit(1);
    }

    char file_name[30];

    strcpy(file_name, argv[1]);
    strcat(file_name, ".txt");

    FILE *fp;
    fp = fopen(file_name, "w");

    if (!fp)
    {
        printf("Erro na abertura do arquivo!\n");
        exit(2);
    }

    fprintf(fp, "Nome: ");
    fprintf(fp, "%s\n", argv[1]);

    fprintf(fp, "Idade: ");
    fprintf(fp, "%s anos", argv[2]);

    fprintf(fp, "\n");
    fclose(fp);

    return 0;
}
``` 

4. Crie uma função que retorna o tamanho de um arquivo, usando o seguinte protótipo: `int tam_arq_texto(char *nome_arquivo);` Salve esta função em um arquivo separado chamado 'bib_arqs.c'. Salve o protótipo em um arquivo chamado 'bib_arqs.h'. Compile 'bib_arqs.c' para gerar o objeto 'bib_arqs.o'.

bib_arqs.h
```
#ifndef BIB_ARQS
#define BIB_ARQS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int tam_arq_texto(char *nome_arquivo);
#endif
```

bib_arqs.c
```
#include "bib_arqs.h"

int tam_arq_texto(char *nome_arquivo)
{

    FILE *fp;
    fp = fopen(nome_arquivo, "r");
    if (!fp)
    {
        printf("Erro ao abrir o arquivo!\n");
        exit(1);
    }

    fseek(fp, 0L, SEEK_END);
    int sz = ftell(fp);

    return sz;
}
```

Compilando no terminal
```
gcc -c bib_arqs.c -o bib_arqs.o
```

5. Crie uma função que lê o conteúdo de um arquivo-texto e o guarda em uma string, usando o seguinte protótipo: `char* le_arq_texto(char *nome_arquivo);` Repare que o conteúdo do arquivo é armazenado em um vetor interno à função, e o endereço do vetor é retornado ao final. (Se você alocar este vetor dinamicamente, lembre-se de liberar a memória dele quando acabar o seu uso.) Salve esta função no mesmo arquivo da questão 4, chamado 'bib_arqs.c'. Salve o protótipo no arquivo 'bib_arqs.h'. Compile 'bib_arqs.c' novamente para gerar o objeto 'bib_arqs.o'.

bib_arqs.h
```
#ifndef BIB_ARQS
#define BIB_ARQS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int tam_arq_texto(char *nome_arquivo);
char *le_arq_texto(char *nome_arquivo);
#endif
```

bib_arqs.c
```
#include "bib_arqs.h"

#define MAX_FILE_SIZE 1000

int tam_arq_texto(char *nome_arquivo)
{

    FILE *fp;
    fp = fopen(nome_arquivo, "r");
    if (!fp)
    {
        printf("Erro ao abrir o arquivo!\n");
        exit(1);
    }

    fseek(fp, 0L, SEEK_END);
    int sz = ftell(fp);

    return sz;
}

char *le_arq_texto(char *nome_arquivo)
{
    FILE *fp;
    fp = fopen(nome_arquivo, "r");
    if (!fp)
    {
        printf("Erro ao abrir o arquivo!\n");
        exit(1);
    }

    char *string = malloc(sizeof(char) * MAX_FILE_SIZE);
    string[0] = getc(fp);

    int i = 1;
    while (!feof(fp))
    {
        fscanf(fp, "%c", &string[i]);
        i++;
    }

    return string;
}
```

Compilando no terminal
```
gcc -c bib_arqs.c -o bib_arqs.o
```

6. Crie um código em C que copia a funcionalidade básica do comando `cat`: escrever o conteúdo de um arquivo-texto no terminal. Reaproveite as funções já criadas nas questões anteriores. Por exemplo, considerando que o código criado recebeu o nome de 'cat_falsificado':

```bash
$ echo Ola mundo cruel! Ola universo ingrato! > ola.txt
$ ./cat_falsificado ola.txt
$ Ola mundo cruel! Ola universo ingrato!
```

Código
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bib_arqs.h"

int main(int argc, char **argv)
{
    if (argc == 2)
    {
        char *s;
        s = le_arq_texto(argv[1]);

        printf("%s\n", s);
    }

    return 0;
}
```

7. Crie um código em C que conta a ocorrência de uma palavra-chave em um arquivo-texto, e escreve o resultado no terminal. Reaproveite as funções já criadas nas questões anteriores. Por exemplo, considerando que o código criado recebeu o nome de 'busca_e_conta':

```bash
$ echo Ola mundo cruel! Ola universo ingrato! > ola.txt
$ ./busca_e_conta Ola ola.txt
$ 'Ola' ocorre 2 vezes no arquivo 'ola.txt'.
```

Código
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bib_arqs.h"

int repeat(char *target, char *string)
{
    unsigned int i = 0;
    unsigned int j = 0;
    unsigned int repeated_times = 0;

    while (i < strlen(string))
    {
        if (string[i] == target[j])
        {
            i++;
            j++;
            
            if (j == strlen(target))
                repeated_times++;
        }
        else
        {
            i++;
            j = 0;
        }
    }

    return repeated_times;
}

int main(int argc, char **argv)
{
    if (argc == 3)
    {
        char *s;
        s = le_arq_texto(argv[2]);

        int repeated = repeat(argv[1], s);
        printf("\'%s\' ocorre %d vezes no arquivo \'%s\'\n", argv[1], repeated, argv[2]);
    }

    return 0;
}
```