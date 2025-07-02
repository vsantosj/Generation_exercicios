//configuração 
const readline = require("readline-sync");

//Entradas
//Ler 10 números inteiros
let numbers = [];

const message = ("===== Contador par e impar =====\n");
console.log(message);

for(let i=1; i <=10;i++){
    let number = readline.questionInt(`Digite o ${i}º número: `);
    numbers.push(number);
}
//processamento
//verificar quantos são pares e quantos são impar
let odd = 0;
let even = 0;
for(let i=0; i < 10;i++){
    if(numbers[i] % 2==0){
        even+=1;
    }else{
        odd+=1;
    } 
}
//saida
console.log(`\nTotal de números pares: ${even}\n`+
           `Total de números Ímpares:${odd}`
);

console.log("\nFinalizando programa...");

