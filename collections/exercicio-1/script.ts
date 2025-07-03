//configuração
import readline = require("readline-sync");

// Array cores

const colors: Array<string> = new Array<string>();
//input 
console.log("===== Ordenar cores =====");
for(let i=1; i<=5; i++){

    let color = readline.question(`Digite a ${i}ª cor: `);
    colors.push(color);
}

//output
console.log("\nListar todas as cores: \n");
printList(colors);

console.log("\nordenadas em ordem crescente: \n");
console.log("Lista de cores o");
printListOrder(colors);


//functions
function printList(list: Array<string>){

    list.forEach(color =>
        console.log(color)
    )
}

function printListOrder(list: Array<string>){
        const sortedList = list.sort();
        sortedList.forEach(color => 
            console.log(color)
        )
}
