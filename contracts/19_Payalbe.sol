// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Payable {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier isOwner{
        require(owner == msg.sender, "No es owner");
        _;
    }

function depositar() public payable {

}

function retirar() public isOwner {
    payable(owner).transfer(address(this).balance);
}

}