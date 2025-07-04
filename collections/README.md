# 📂 Exercícios de Lógica de Programação em TypeScript

Este repositório contém 4 exercícios desenvolvidos em **TypeScript**, com foco em lógica de programação utilizando estruturas de dados como `Array` e `Set`.

As entradas de dados são feitas via terminal com a biblioteca [`readline-sync`](https://www.npmjs.com/package/readline-sync).

## 📘 Lista de Exercícios

### exercicio-1

**Descrição:** 
Programa em TypeScript que utiliza um array de strings para armazenar 5 cores informadas pelo usuário via teclado.  
Após a entrada dos dados, o programa exibe:

- Todas as cores adicionadas.
- As cores ordenadas em ordem alfabética (crescente).


### exercicio-2

**Descrição:**
Programa em TypeScript que usa um array de 10 números inteiros para buscar a posição de um número digitado pelo usuário. Exibe a posição ou uma mensagem caso o número não seja encontrado.

### exercicio-3
**Descrição:** 
Programa em TypeScript que armazena 10 números inteiros únicos em um Set e exibe os elementos na tela.

### exercicio-4
**Descrição:** 
Programa em TypeScript que cria uma coleção Set com 10 números inteiros.
O usuário digita um número e o programa verifica se ele está no Set, exibindo mensagem de encontrado ou não encontrado.
## Tecnologias Utilizadas

- **TypeScript** – Para escrever o código com tipagem.
- **Node.js** – Para executar o projeto no terminal.
- **ts-node** – Para rodar arquivos `.ts` diretamente sem precisar compilar.
- **readline-sync** – Para ler entradas do usuário no terminal.

##  Como executar o

### ⚙️ Pré-requisitos

Antes de executar este projeto, certifique-se de ter instalado em sua máquina:

- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)
- [TypeScript](https://www.typescriptlang.org/) e [ts-node](https://typestrong.org/ts-node) (opcional para execução direta)

Você pode instalar as ferramentas globais com:

```bash
npm install -g typescript ts-node

cd nome-do-repositorio
tsc-node nome-do-arquivo.ts