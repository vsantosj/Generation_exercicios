

const readline = require("readline-sync");

console.log("===== verificar se a soma de A+B é maior menor ou igual a C =====");

//variaveis 
let numeroA = readline.questionInt("Digite o número A: ");
let numeroB = readline.questionInt("Digite o número B: ");
let numeroC = readline.questionInt("Digite o número C: ");
let somaAB = numeroA+numeroB;

//condição
if(somaAB > numeroC){
    console.log(`\nA Soma do numeroA(${numeroA}) e numeroB(${numeroB}) é Maior do que numeroC(${numeroC})`);
}
else if(somaAB < numeroC){
    console.log(`\nA Soma do numeroA(${numeroA}) e numeroB(${numeroB}) é Menor do que numeroC(${numeroC})`);
}else{
    console.log(`\nA Soma do numeroA(${numeroA}) e numeroB(${numeroB}) é Igual ao numeroC(${numeroC})`);
}