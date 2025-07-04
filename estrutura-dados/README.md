# 📂 Exercícios de Lógica de Programação em TypeScript

Este repositório contém **2 exercícios** desenvolvidos em **TypeScript**, com foco em lógica de programação utilizando estruturas de dados do tipo **`Queue` (Fila)** e **`Stack` (Pilha)**.

As entradas de dados são feitas via terminal utilizando a biblioteca [`readline-sync`](https://www.npmjs.com/package/readline-sync).

---

## 📘 Lista de Exercícios

### 📄 exercicio-1 – Fila de Clientes do Banco
**Descrição:**  
Programa que utiliza uma `Queue` (Fila) de **strings** para simular a fila de atendimento de um banco.

O programa exibe um menu com as seguintes opções:
- **1**: Adicionar um novo cliente à fila (solicita o nome).
- **2**: Listar todos os clientes na fila.
- **3**: Chamar (retirar) um cliente da fila.
- **0**: Finalizar o programa.

⚠️ Caso a fila esteja vazia ao tentar retirar um cliente, o programa exibirá uma mensagem informando que **a fila está vazia**.

---

### 📄 exercicio-2 – Pilha de Livros
**Descrição:**  
Programa que utiliza uma `Stack` (Pilha) de **strings** para simular a organização de uma pilha de livros.

O programa exibe um menu com as seguintes opções:
- **1**: Adicionar um novo livro à pilha (solicita o nome).
- **2**: Listar todos os livros da pilha.
- **3**: Retirar um livro da pilha.
- **0**: Finalizar o programa.

⚠️ Caso a pilha esteja vazia ao tentar retirar um livro, o programa exibirá uma mensagem informando que **a pilha está vazia**.

---

## 🚀 Tecnologias Utilizadas

- **TypeScript** – Linguagem com tipagem estática.
- **Node.js** – Ambiente de execução para JavaScript/TypeScript.
- **ts-node** – Permite executar arquivos `.ts` diretamente no terminal.
- **readline-sync** – Leitura síncrona de entrada de dados via terminal.

---

## ▶️ Como Executar

### ⚙️ Pré-requisitos

Antes de executar os exercícios, você precisa ter instalado:

- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)
- [TypeScript](https://www.typescriptlang.org/)
- [ts-node](https://typestrong.org/ts-node)

### 📥 Instalação

```bash
# Instale TypeScript e ts-node globalmente
npm install -g typescript ts-node

# Clone o repositório e acesse a pasta
git clone https://github.com/seu-usuario/nome-do-repositorio.git
cd nome-do-repositorio
