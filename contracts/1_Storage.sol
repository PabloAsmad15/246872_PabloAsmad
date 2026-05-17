// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Intro {
    
    uint256 public cantidad;
    
    function cambiarCantidad(uint256 _cantidad) public {
        cantidad = _cantidad;
    }
    
}