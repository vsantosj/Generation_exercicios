//"configuração"
const readline = require("readline-sync");
// dados de entrada
// ler 2 numero inteiros
const message = ("\n===== Buscador de Múltiplos de 3 e 5 em um intervalo =====\n");
console.log(message);


let number1 = readline.questionInt("Digite o primeiro número: ");

let number2 = readline.questionInt("Digite o segundo número: ");


//regras
//primero numero deve ser menor do que o segundo
if(number1 > number2){
    console.log("\nIntervalo Inválido. O primeiro número deve ser menor que o segundo.");
}else{
    for(let i = number1; i <=number2;i++){
        if((i%3==0) && (i% 5==0)){
            console.log(`${i} é múltiplo de 3 e 5`);
        }
    }
}

console.log("\nFinalizando programa...");

