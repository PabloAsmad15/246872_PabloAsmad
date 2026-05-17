// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract CompMapping {
    //Struct
    struct Empleado {
        string nombre;
        uint edad;
    }

    
    mapping(uint => Empleado) public empleados;

    uint public secuencial; // Se añade esta línea para que la función secuencial funcione

    function addEmpleado(uint256 id, string memory _nombre, uint _edad) public {
        empleados[id] = Empleado(_nombre, _edad);
    }

    function addEmpleadoSecuencial(string memory _nombre, uint _edad) public {
        empleados[secuencial] = Empleado(_nombre, _edad);
        secuencial = secuencial + 1;
    }
}