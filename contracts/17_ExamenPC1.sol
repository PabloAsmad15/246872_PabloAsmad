// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract AlmacenTech246872 { 

    struct Componente {
        uint256 id;
        string modelo;
        uint256 precio;
        bool estado; 
    }

    Componente[] public componentes;

    modifier logEjecutor() {
        console.log("Ejecutado por: 246872 - Pablo Enrique Asmad Morgado");
        _;
    }

    constructor() logEjecutor {
    }

    function agregarElemento(uint256 _id, string memory _modelo, uint256 _precio) public logEjecutor {
        for (uint256 i = 0; i < componentes.length; i++) {
            require(componentes[i].id != _id, "Componente con ese ID ya existe");
        }
        require(_precio > 0, "El precio debe ser mayor a cero");
        componentes.push(Componente(_id, _modelo, _precio, true));
    }

    function contarElementos() public view logEjecutor returns (uint256) {
        return componentes.length;
    }

    function inactivarElemento(uint256 _posicion) public logEjecutor {
        require(_posicion < componentes.length, "Posicion fuera de rango");
        componentes[_posicion].estado = false;
    }

    function pintarElementosActivos() public view logEjecutor {
        for (uint256 i = 0; i < componentes.length; i++) {
            if (componentes[i].estado == true) {
                console.log("Componente activo:", componentes[i].id, componentes[i].modelo);
            }
        }
    }

    function pintarElementosImpares() public view logEjecutor {
        for (uint256 i = 0; i < componentes.length; i++) {
            if (componentes[i].id % 2 != 0) {
                console.log("Componente impar:", componentes[i].id, componentes[i].modelo);
            }
        }
    }
}