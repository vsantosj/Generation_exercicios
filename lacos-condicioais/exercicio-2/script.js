const readline = require("readline-sync");

let numeroEntrada = readline.questionInt("Digite um número inteiro: ");

let numeroPar = numeroEntrada %2 ==0;
let numeroPositivo = numeroEntrada >=0;

if (numeroPar && numeroPositivo){
    console.log(`O Número ${numeroEntrada} é par e positivo!`);
}
else if(!numeroPar && numeroPositivo){
    console.log(`\nO Número ${numeroEntrada} é impar e positivo!`);
}else if(numeroPar && !numeroPositivo ){
    console.log(`\nO Número ${numeroEntrada} é par e negativo!`);
}else{
    console.log(`\nO Número ${numeroEntrada} é impar e negativo!`);
}




