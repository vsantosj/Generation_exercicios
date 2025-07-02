const readline = require("readline-sync");

let totalCalculo = 0;
let opcao = -1;

console.log("===== CALCULADORA =====\n");

while (opcao !== 0) {
    opcao = readline.questionInt(
        "Digite o número da opção desejada: \n" +
        "1: SOMA\n" +
        "2: SUBTRAÇÃO\n" +
        "3: MULTIPLICAÇÃO\n" +
        "4: DIVISÃO\n" +
        "0: SAIR\n>> "
    );

    if (opcao < 0 || opcao > 4) {
        console.log("Operação inválida. Escolha um número entre 1 e 4.\n");
        continue;
    }

    if (opcao === 0) {
        console.log("\nFinalizando programa...");
        break;
    }

    let numero1 = readline.questionFloat("Digite o primeiro número: \n>> ");
    let numero2 = readline.questionFloat("Digite o segundo número: \n>> ");

    switch (opcao) {
        case 1:
            totalCalculo = numero1 + numero2;
            console.log(`Resultado: ${numero1} + ${numero2} = ${totalCalculo}`);
            break;
        case 2:
            totalCalculo = numero1 - numero2;
            console.log(`Resultado: ${numero1} - ${numero2} = ${totalCalculo}`);
            break;
        case 3:
            totalCalculo = numero1 * numero2;
            console.log(`\nResultado: ${numero1} * ${numero2} = ${totalCalculo}`);
            break;
        case 4:
            if (numero2 === 0) {
                console.log("\nErro: divisão por zero não é permitida.");
            } else {
                totalCalculo = numero1 / numero2;
                console.log(`Resultado: ${numero1} / ${numero2} = ${totalCalculo}`);
            }
            break;
    }

}
