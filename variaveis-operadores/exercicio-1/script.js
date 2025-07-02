const readline = require('readline-sync');

console.log("\n========== Calculadora Novo salário com Abono ========== \n");

//Entrada
let salario = readline.questionFloat("Digite seu salário (Utilize ponto ao invés de virgula): ");

let abono = readline.questionFloat("Digite o valor do seu abono (Utilize ponto ao invés de virgula): ");

console.log(`Você digitou o salário no valor de R$: ${salario.toFixed(2)} e abono no valor de R$: ${abono} \n`);

//Processamento
let novoSalario = salario + abono;

//Saída
console.log(`Seu novo salário é de R$: ${novoSalario.toFixed(2)} \n`);
console.log("Programa finalizado.");