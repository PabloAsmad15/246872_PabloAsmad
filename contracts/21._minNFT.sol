// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract minNFt is ERC721, Ownable {

    constructor(string memory name, string memory simbol)
        ERC721(name, simbol)
        Ownable(msg.sender)
    {

    }

    function mint(address to, uint256 id) public onlyOwner {
        _safeMint(to, id);
    }
}