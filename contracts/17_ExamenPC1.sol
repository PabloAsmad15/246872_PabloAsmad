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

    uint256 public cantidad;

    mapping(uint256 => Componente) public componentes;
    
    uint256[] private listaIds;

    modifier logEjecutor() {
        console.log("Ejecutado por: 246872 - Pablo Enrique Asmad Morgado");
        _;
    }

    constructor() logEjecutor {
    }

    function agregarElemento(uint256 _id, string memory _modelo, uint256 _precio) public logEjecutor {

        require(componentes[_id].id == 0, "Componente con ese ID ya existe");
        require(_precio > 0, "El precio debe ser mayor a cero");
        

        componentes[_id] = Componente(_id, _modelo, _precio, true);

        listaIds.push(_id);
        
        cantidad++;
    }


    function contarElementos() public view logEjecutor returns (uint256) {
        return cantidad;
    }


    function inactivarElemento(uint256 _id) public logEjecutor {
        require(componentes[_id].id != 0, "El ID introducido no existe");
        componentes[_id].estado = false;
    }

    function pintarElementosActivos() public view logEjecutor {
        for (uint256 i = 0; i < listaIds.length; i++) {
            uint256 idActual = listaIds[i];
            if (componentes[idActual].estado == true) {
                console.log("Componente activo:", componentes[idActual].id, componentes[idActual].modelo);
            }
        }
    }

    function pintarElementosImpares() public view logEjecutor {
        for (uint256 i = 0; i < listaIds.length; i++) {
            uint256 idActual = listaIds[i];
            if (componentes[idActual].id % 2 != 0) {
                console.log("Componente impar:", componentes[idActual].id, componentes[idActual].modelo);
            }
        }
    }
}