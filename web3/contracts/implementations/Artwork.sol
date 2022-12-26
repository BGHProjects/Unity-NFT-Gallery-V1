//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "../abstracts/ContextMixin.sol";

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@opengsn/contracts/src/ERC2771Recipient.sol";

contract Artwork is ERC721Upgradeable, ERC721EnumerableUpgradeable, ERC721URIStorageUpgradeable,ContextMixin, ERC2771Recipient {

    function initialize(string memory name, string memory symbol, address _trustedForwarder) initializer public {
        __ERC721_init(name, symbol);
        _setTrustedForwarder(_trustedForwarder);
    }

    function mint(string memory _tokenURI) public {
        _safeMint(_msgSender(), totalSupply());
        _setTokenURI(totalSupply(), _tokenURI);
    }

    // The following functions are required by GSN

    function _msgSender() internal view override(ContextUpgradeable, ERC2771Recipient) returns (address sender)
    {
         if (msg.data.length >= 20 && isTrustedForwarder(msg.sender)) {
            // At this point we know that the sender is a trusted forwarder,
            // so we trust that the last bytes of msg.data are the verified sender address.
            // extract sender address from the end of msg.data
            assembly {
                sender := shr(96,calldataload(sub(calldatasize(),20)))
            }
        } else {
            // Use ContextMixin's logic to perform the meta-transaction
            sender = ContextMixin.msgSender();
        }
    }

    function _msgData() internal view virtual override(ContextUpgradeable, ERC2771Recipient) returns (bytes calldata ret)
    {
        return super._msgData();
    }

    // The following functions are overrides required by Solidity for using the Upgradeable ERC721.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721Upgradeable, ERC721EnumerableUpgradeable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
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