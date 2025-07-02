const readline = require('readline-sync');

console.log("\n========== Calculadora de Notas ========== \n");

// Entrada
let nota1 = readline.questionFloat("Entre com a primeira nota: ");
let nota2 = readline.questionFloat("Entre com a segunda nota: ");
let nota3 = readline.questionFloat("Entre com a terceira nota: ");
let nota4 = readline.questionFloat("Entre com a quarta nota: ");

//Processamento
let mediaFinal = (nota1 + nota2 + nota3 + nota4) / 4;

//Saída
console.log(`\n Você digitou as notas: primeira nota ${nota1}, segunda nota ${nota2}, terceira nota ${nota3} e quarta nota ${nota4} \n`);

console.log(`Sua média final é: ${mediaFinal.toFixed(1)} \n`);

console.log("Programa finalizado.");