// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BallenitaFCToken is ERC20, Ownable {
    uint256 public maxSupply;

    uint256 public precioToken = 0.001 ether;
    

    constructor () ERC20("BallenitaFCToken", "BFT") Ownable(msg.sender) {
        _mint(owner(), 1000 * 10 **18);
    }

    function mintiar(address to, uint cantidad) public onlyOwner {
        _mint(to, cantidad);
    }
    function essocio(address cuenta) public view returns(bool) {
        return balanceOf(cuenta) > 0;
    }
    function balanceOfBFT(address account) public view returns(uint256) {
        return balanceOf(account)/ 10 ** 18;
    }
    function comprarToken() public payable{
        require(msg.value > 0, "Debes enviar un valor minimo de 1 ETH");
        uint256 cantidad = msg.value / precioToken;
        require(cantidad > 0, "El ETH enviado es insuficiente");
        _mint(msg.sender, cantidad * 10 **18);

    } 
    function retirar () public onlyOwner {
        payable(owner()).transfer(address(this).balance); 
    }

}