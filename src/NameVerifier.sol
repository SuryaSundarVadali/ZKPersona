//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./verifier.sol";

contract NameHashVerifier {
    Groth16Verifier public verifierContract;

    event Verified(address indexed verifier, bool result);

    constructor(address _verifierAddress) {
        verifierContract = Groth16Verifier(_verifierAddress);  // Initialize the verifier contract
    }

    function verifyNameHash(
        uint[2] memory a,
        uint[2][2] memory b,
        uint[2] memory c,
        uint[1] memory input  // Public input (the nameHash in this case)
    ) public returns (bool) {
        bool result = verifierContract.verifyProof(a, b, c, input);
        emit Verified(msg.sender, result);
        return result;
    }

    function getExpectedNameHash() public pure returns (uint) {
        return 12767262212413745205366229867810775946694071414158353557840742248640133905734;
    }
}