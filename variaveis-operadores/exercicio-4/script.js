
const readline = require("readline-sync");

console.log("\n========== Calculadora de diferença 2 produtos ========== \n");
// Entrada
let numero1 = readline.questionFloat("Entre com o primeiro número: ");
let numero2 = readline.questionFloat("Entre com o segundo número: ");
let numero3 = readline.questionFloat("Entre com o terceiro número: ");
let numero4 = readline.questionFloat("Entre com o quarto número: ");

//Processamento
let diferenca = (numero1*numero2) - (numero3*numero4);

//saida
let mensagemResultado = `\nA diferença entre o produto de ${numero1.toFixed(1)} e ${numero2.toFixed(1)} e o produto de ${numero3.toFixed(1)} e ${numero4.toFixed(1)} é de: ${diferenca.toFixed(1)}`;

console.log(mensagemResultado);
console.log("\nPrograma finalizado.");