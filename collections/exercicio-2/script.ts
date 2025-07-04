//config
import readline = require("readline-sync");

const numbers: Array<number> = new Array<number>(2, 5, 1, 3, 4, 9, 7, 8, 10, 6);

console.log("\n===== Buscador de posição de números =====\n");
let numberFind: number = readline.questionInt("Digite o número que você deseja encontrar: ");
findPosition(numberFind);

//functions
function findPosition(numberFind: number){
    let indexNumber: number = numbers.indexOf(numberFind);
    
    if (indexNumber !== -1) {
        console.log(`\nO número ${numberFind} está localizado na posição: ${indexNumber}`);
    } else {
        console.log(`\nO número ${numberFind} não foi encontrado.`);
    }    
}





