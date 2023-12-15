var database = require("../database/config");

function buscar() {

    instrucaoSql = `
    select dht11_temperatura as temperatura, momento as momento from medida;
    `


    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}




module.exports = {
    buscar
}
