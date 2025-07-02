//configuração
const readline = require("readline-sync");

let age = 1;
let ageOver50 = 0;
let ageUnder21 = 0;

//laço
while (age >= 0) {
  age = readline.questionInt("Digite uma idade ou (0) para sair): ");

  if (age < 0 || age == 0) {
    break; 
  }

  if (age < 21) {
    ageUnder21 += 1;
  } else if (age > 50) {
    ageOver50 += 1;
  }

}
//saida
console.log("============== ++++ ==============");
console.log(`Total de pessoas menores de 21 anos: ${ageUnder21}`);
console.log(`Total de pessoas maiores de 50 anos: ${ageOver50}`);



