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
            nextClient();
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
    console.log("3 - Chamar cliente para ser atendido");
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
        console.log("Não há clientes na espera de ser atendido.")
    } else {
        console.log("Lista de Clientes para ser atendido: :");
        clients.printQueue();
    }

}
function nextClient() {
    if (clients.count() == 0) {
        console.log("\nNão há clientes para ser atendido.");
    } else {
        let nextClient = clients.peek();
        console.log(`O cliente ${nextClient} deve ser chamado para atendimento.`);
    }
}

