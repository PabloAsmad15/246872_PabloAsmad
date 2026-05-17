// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract AlmacenTech246872 { 

    struct Componente {
        uint256 id;
        string modelo;
        uint256 precio;
    }
    

    Componente[] public componentes;

    constructor() {
        console.log("Ejecutado por: 246872 - Pablo Enrique Asmad Morgado");
    }
}