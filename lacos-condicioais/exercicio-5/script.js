const readline = require("readline-sync");

let totalAPagar = 0;
let opcao = -1;

console.log("===== Bem-vindo à Lanchonete da Vivi =====\n");

while (opcao !== 0) {
    opcao = readline.questionInt(
        "Digite o número da opção desejada:\n" +
        "1: Cachorro Quente (R$10,00)\n" +
        "2: X-Salada (R$15,00)\n" +
        "3: X-Bacon (R$18,00)\n" +
        "4: Bauru (R$12,00)\n" +
        "5: Refrigerante (R$8,00)\n" +
        "6: Suco de laranja (R$13,00)\n" +
        "0: Finalizar compra\n>> "
    );
    if (opcao < 0 || opcao >6){
        console.log("Sua opção não temos no cardápio! Escolha um opção de 1 a 6.");
        continue;
    }
    if (opcao === 0) {
        console.log("\nCompra finalizada.");
        break;
    }

    let quantidade = readline.questionInt("Agora entre com a quantidade desejada\n>> ");

    switch (opcao) {
        case 1:
            totalAPagar += quantidade * 10.00;
            break;
        case 2:
            totalAPagar += quantidade * 15.00;
            break;
        case 3:
            totalAPagar += quantidade * 18.00;
            break;
        case 4:
            totalAPagar += quantidade * 12.00;
            break;
        case 5:
            totalAPagar += quantidade * 8.00;
            break;
        case 6:
            totalAPagar += quantidade * 13.00;
            break;
        default:
            console.log("Entre com uma opção válida.");
    }

    console.log(`\nSubtotal até agora: R$ ${totalAPagar.toFixed(2)}\n`);
}

console.log(`\nTotal a pagar: R$ ${totalAPagar.toFixed(2)}\nAgradecemos sua compra!`);
  



