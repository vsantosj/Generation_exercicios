//config
import readline = require("readline-sync");

//variaveis
const numbers: Set<number> = new Set<number>();

let stop: string = "s";
//iniciar programa....
    load();
    printNumbers(numbers);
//functions
function load(){
    console.log("===== Digite 10 números inteiros =====\n");
    for(let i=1; i<=10; i++){
    
        let number = readline.questionInt(`Digite o ${i}ª numero: `);
        numbers.add(number);
    }
}

function printNumbers(set: Set<number>){
    console.log("\Listar dados do Set: ");
    for(let number of numbers){
        console.log(number);
    }
}
