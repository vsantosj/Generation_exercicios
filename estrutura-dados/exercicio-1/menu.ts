import readline from "readline-sync";
import { Queue } from "./queue-methods";

const clients = new Queue<string>();
let client: string;
let option: number = -1;



while (option !== 0) {
    menu();
    option = readline.questionInt("Entre com a opção desejada: ");

    switch (option) {
        case 1:
            addClient();
            break;
        case 2:
            listClient();
            break;
        case 3:
            removeClient();
            break;
        case 4:
            clients.clear();
            break;
        default:
            if (option == 0) {
                console.log("\nAgradecemos seu contato.\n")
            } else {
                console.log("\nOpçao inválida. Tente novamente.");
            }
    }
}

console.log("finalizando programa...")

//functions
function menu() {
    console.log("\n========== Sistema atendimento ==========");
    console.log("1 - Adicionar um novo Cliente.");
    console.log("2 - Listar todos os Clientes.");
    console.log("3 - Remover cliente da fila");
    console.log("4 - Limpar lista de cliente");
    console.log("0 - O programa deve ser finalizado.");
    console.log();
}

function addClient() {
    client = readline.question("Digite o nome do cliente: ");
    clients.enqueue(client);
    console.log("cliente adicionado!\n")
}
function listClient() {
    let valid = clients.isEmpty();
    if (valid) {
        console.log("Não há clientes na fila.")
    } else {
        console.log("Lista de Clientes na fila: :");
        clients.printQueue();
    }

}
function removeClient() {
    if (clients.count() == 0) {
        console.log("\nNão há clientes na fila");
    } else {
        clients.dequeue();
        console.log("Cliente removido da fila.");
    }
}

