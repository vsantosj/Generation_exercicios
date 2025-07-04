import readline from "readline-sync";
import { Stack } from "./stack-methods";

const books = new Stack<string>();
let option: number = -1;

while (option !== 0) {
    menu();
    option = readline.questionInt("Entre com a opção desejada: ");

    switch (option) {
        case 1:
            addBook();
            break;
        case 2:
            listBooks();
            break;
        case 3:
            removeBook();
            break;
        default:
            if (option == 0) {
                console.log("\nVolte sempre! \n")
            } else {
                console.log("\nOpçao inválida. Tente novamente.");
            }
    }
}

console.log("Finalizando o programa...")

//functions

function menu() {
    console.log("\n========== Sistema Pilha Livros ==========");
    console.log("1 - Adicionar um novo Livro.");
    console.log("2 - Listar todos os Livros da pilha.");
    console.log("3 - Retirar um livro da Pilha.");
    console.log("0 - O programa deve ser finalizado.");
    console.log("\n==========================================\n");
}


function addBook() {
    let book: string;
    book = readline.question("Digite o nome do livro: ");
    books.push(book);
    console.log("Livro adicionao!")
}

function listBooks() {
    if (books.isEmpty()) {
        console.log("A Pilha de livros está vazia!");
    } else {
        console.log("Lista de Livros na Pilha: ");
        books.printStack();
    }
}


function removeBook() {
    if (books.count() == 0) {
        console.log("A Pilha de livros está vazia!")
    } else {
        books.pop();
        console.log("Um Livro foi retirado da pilha!");
    }
}