const readline = require('readline-sync');

console.log("\n========== Calculadora de Salário líquido ========== \n");

// Entrada
let salarioBruto = readline.questionFloat("Entre com valor do salário bruto: ");
let adicionalNoturno = readline.questionFloat("Entre com valor do adicional Noturno: ");
let horasExtras = readline.questionFloat("Entre com valor das horas extras: ");
let descontosColaborador = readline.questionFloat("Entre com valor de descontos de um colaborador: ");


//processamento
let salarioLiquido = salarioBruto + adicionalNoturno + (horasExtras *5) - descontosColaborador;

//saida 
console.log(`\nSeu salário líquido será no valor de: R$: ${salarioLiquido.toFixed(2)}`);