// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BallenitaFCToken is ERC20 {
    address public owner;

    uint256 public maxSupply;

    constructor () ERC20("BallenitaFCToken", "BFT"){

        owner = msg.sender;
        _mint(owner, 3000);
    }

    modifier isOwner{
        require(msg.sender == owner, "No es propietario");
        _;
    }
    function mintiar(address to, uint cantidad) public isOwner {
        _mint(to, cantidad);
    }
    function essocio(address cuenta) public view returns(bool) {
        return balanceOf(cuenta) > 0;
    }

}