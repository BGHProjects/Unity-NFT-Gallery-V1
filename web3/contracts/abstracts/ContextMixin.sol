// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.17;

// ? Required for meta-transactions, in order to use meta-transactions (which is required for GSN) and list with OpenSea
// ? https://docs.opensea.io/docs/polygon-basic-integration

abstract contract ContextMixin {
    function msgSender()
        internal
        view
        returns (address payable sender)
    {
        if (msg.sender == address(this)) {
            bytes memory array = msg.data;
            uint256 index = msg.data.length;
            assembly {
                // Load the 32 bytes word from memory with the address on the lower 20 bytes, and mask those.
                sender := and(
                    mload(add(array, index)),
                    0xffffffffffffffffffffffffffffffffffffffff
                )
            }
        } else {
            sender = payable(msg.sender);
        }
        return sender;
    }
}