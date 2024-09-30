## ZKPersona Circuit

This circuit project contains all the necessary ingredients to upload to Sindri's API and start requesting proofs.

The circuit language is written in circom and will produce proofs that two variables x and y (public) are equal.


Commands for generating circuit:
1. circom Name.circom --r1cs --wasm --sym
2. snarkjs powersoftau new bn128 12 pot12_0000.ptau
3. snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution"
4. snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau
5. snarkjs groth16 setup Name.r1cs pot12_final.ptau circuit_final.zkey
6. node Name_js/generate_witness.js Name_js/Name.wasm input.json witness.wtns
7. snarkjs zkey export verificationkey circuit_final.zkey verification_key.json
8. snarkjs groth16 prove circuit_final.zkey witness.wtns proof.json public.json
9. snarkjs groth16 verify verification_key.json public.json proof.json
10. snarkjs zkey export solidityverifier circuit_final.zkey verifier.sol
