//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "../interfaces/IArtwork.sol";

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Artwork is ERC721Upgradeable, ERC721EnumerableUpgradeable, ERC721URIStorageUpgradeable, IArtwork, OwnableUpgradeable {

    uint256 public tokenCounter;

    function initialize(string memory name, string memory symbol) initializer public {
        // Initialise all upgradeable ERC721 variants
        __ERC721_init(name, symbol);
        __ERC721Enumerable_init();
        __ERC721URIStorage_init();
        __Ownable_init();

        tokenCounter = 0;
    }

    function mint(string memory _tokenURI) public {
        _safeMint(_msgSender(), tokenCounter);
        _setTokenURI(tokenCounter, _tokenURI);
        tokenCounter++;
    }

    // The following functions are overrides required by Solidity to use the Upgradeable ERC721

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721Upgradeable, ERC721EnumerableUpgradeable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function burn(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721Upgradeable, ERC721URIStorageUpgradeable) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721Upgradeable, ERC721URIStorageUpgradeable)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721Upgradeable, ERC721EnumerableUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

}