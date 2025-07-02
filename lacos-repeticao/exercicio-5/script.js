//configuração
const readline = require("readline-sync");

let number;
let sumNumber = 0;

do{
    number = readline.questionInt("Digite um número (Digite 0 para sair): ");
    //somar apenas números positivos
    if(number > 0){
        sumNumber+=number;
    }
// ler números inteiros enquanto diferente de 0
}while(number !== 0){
}
console.log(`A soma dos números positivos é: ${sumNumber}`)

