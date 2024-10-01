pragma circom 2.0.0;

include "node_modules/circomlib/circuits/poseidon.circom"; 

template Name() {

    // Public inputs
    signal input nameHash; 
    
    // Private inputs
    signal input name; 

    signal computedHash;

    component poseidon = Poseidon(1);
    poseidon.inputs[0] <== name; 


    computedHash <== poseidon.out;


    computedHash === nameHash;
}

                                   
component main {public[nameHash]} = Name();
