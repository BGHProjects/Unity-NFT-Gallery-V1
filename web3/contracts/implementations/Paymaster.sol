//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@opengsn/contracts/src/BasePaymaster.sol";

contract Paymaster is BasePaymaster {

    address private artwork; 
    string private constant version = "^3.0.0-beta.1";

    constructor(
        address _artwork,
        IRelayHub _relayHub
    ) {
        artwork = _artwork;
        setTrustedForwarder(0x7A95fA73250dc53556d264522150A940d4C50238);
        setRelayHub(_relayHub);
    }

    function versionPaymaster() external view override virtual returns (string memory){
        return version;
    }

    function _preRelayedCall(
        GsnTypes.RelayRequest calldata relayRequest,
        bytes calldata signature,
        bytes calldata approvalData,
        uint256 maxPossibleGas
    )
    internal
    override
    virtual
    returns (bytes memory context, bool revertOnRecipientRevert) {
        (relayRequest, signature, approvalData, maxPossibleGas);
        require(relayRequest.request.to==artwork, "wrong target");
	    // returning "true" means this paymaster accepts all requests that
	    // are not rejected by the recipient contract.
        return ("", true);
    }

    function _postRelayedCall(
        bytes calldata context,
        bool success,
        uint256 gasUseWithoutPost,
        GsnTypes.RelayData calldata relayData
    )
    internal
    override
    virtual {
        (context, success, gasUseWithoutPost, relayData);
    }
}