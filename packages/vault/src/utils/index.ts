import { helpers } from '@gribi/circuits';
import { CompiledCircuit, BarretenbergBackend, ProofData } from '@noir-lang/backend_barretenberg';
import { InputMap } from '@noir-lang/noirc_abi';
import { Noir } from '@noir-lang/noir_js'
import * as CryptoJS from "crypto-js";
import { toHex, encodePacked, keccak256 } from 'viem';


//This might seem really, really dumb but it's the easiest way to ensure parity

/**
 * Creates a pedersen hash of the inputs
 * 
 * @param inputs an array of Fields 
 * @returns a Pedersen hash of the inputs
 */
async function pedersenHash(inputs: bigint[]): Promise<bigint> {
    let padded = inputs;
    if (inputs.length < 8) {
        padded = inputs.concat(Array(8 - inputs.length).fill(0))
    }
    if (inputs.length > 8) {
        throw new Error("Private inputs must be 7 elements or less");
    }
    const backend = new BarretenbergBackend(helpers);
    const noir = new Noir(helpers, backend);
    const input = padded.map((e) => toHex(e));
    let output = await noir.execute({
        "input": input
    });

    return BigInt(output.returnValue.toString());
}

async function keccak(inputs: bigint[]): Promise<bigint> {
    const bytes = encodePacked(['uint256[]'], [inputs]);
    return BigInt(keccak256(bytes)) as bigint;
}

/**
 * Quickly generates a random number with 128-bits of security.
 * 
 * @param bitsSecurity  allows you to configure bits of security, but it should be multiple of 8
 */
function rng(bitsSecurity?: number): BigInt {
    let nBits = 248;
    if (bitsSecurity) {
        nBits = bitsSecurity % 8 !== 0 ? (
            bitsSecurity > 8 ? (Math.round(bitsSecurity / 8) * 8) : 8
        ) : bitsSecurity;
    }
    const rand = CryptoJS.lib.WordArray.random(nBits / 8);
    return BigInt(`0x${rand.toString()}`);
}

const EmptyOp = () => ({ opid: 0, value: 0, nullifier: 0 });
const EmptyInput = () => ({ slot: 0, value: 0 });

export const Utils = {
    pedersenHash,
    keccak,
    rng,
    EmptyInput,
    EmptyOp,
}
