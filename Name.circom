pragma circom 2.0.0;

include "node_modules/circomlib/circuits/poseidon.circom";  // Including Poseidon hash

// Name verification circuit
template Name() {

    // Public inputs
    signal input nameHash;  // Hash of the name (public input for the verifier)
    
    // Private inputs
    signal input name;  // Person's name (private input for the prover)
    
    // Signal to hold the computed hash of the provided name
    signal computedHash;
    
    // Hash the name using the Poseidon hash function
    component poseidon = Poseidon(1);
    poseidon.inputs[0] <== name;  // Input the name to the Poseidon hash

    // Output the hash of the name
    computedHash <== poseidon.out;

    // Check if the computed hash matches the provided hash (correctHash)
    computedHash === nameHash;
}

// Main circuit                                     
component main {public[nameHash]} = Name();
