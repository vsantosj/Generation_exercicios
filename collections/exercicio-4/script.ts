//config
import readline = require("readline-sync");

const numbers: Set<number> = new Set<number>([2, 5, 1, 3, 4, 9, 7, 8, 10, 6]);


console.log("\n===== Buscador de posição de números =====\n");
let numberFind: number = readline.questionInt("Digite o número que você deseja encontrar: ");
findPosition(numberFind);

//functions
function findPosition(numberFind: number){
    let indexNumber: boolean = numbers.has(numberFind);
    
    if (indexNumber == true) {
        console.log(`\nO número ${numberFind} foi encontrado.`);
    } else {
        console.log(`\nO número ${numberFind} não foi encontrado.`);
    }    
}