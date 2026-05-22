// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 👇 CHANGE #1: Rename "MyToken" to your contract name (no spaces, capitalize each word)
contract MyToken is ERC20 {

    constructor()
        // 👇 CHANGE #2: Set your token's NAME and SYMBOL
        ERC20("My Token", "MTK")
    {
        // 👇 CHANGE #3: Set the INITIAL SUPPLY (in whole tokens)
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }

    // 👇 OPTIONAL: Uncomment to change decimals (default is 18).
    //    6 = USDC-style, 0 = whole tokens only (no fractions).
    //
    // function decimals() public pure override returns (uint8) {
    //     return 6;
    // }
}
