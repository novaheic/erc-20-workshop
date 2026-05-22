# ERC-20 Token Workshop 📄

Build and deploy your own ERC-20 token to the **Sepolia test network** using MetaMask. By the end you'll have a real, live token on a public testnet that you can view in a block explorer.

## What you'll need

- A web browser
- [remix.ethereum.org](https://remix.ethereum.org) (runs in-browser, nothing to install)
- The [MetaMask](https://metamask.io) browser extension
- A small amount of **Sepolia test ETH** (free — see Setup below)

---

## Step 1 — Open Remix

Go to [remix.ethereum.org](https://remix.ethereum.org). It runs entirely in your browser.

## Step 2 — Create your file

In the left **File Explorer** panel, click the new-file icon. Name it `MyToken.sol` and paste in the starter code:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 👇 CHANGE #1: Rename "MyToken" to your contract name
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
```

## Step 3 — Customize your token

Make your edits:

| Change | What to edit | Example |
|--------|-------------|---------|
| **#1 Contract name** | Replace `MyToken` (no spaces, capitalize words) | `GoldCoin` |
| **#2 Name & symbol** | The two strings in `ERC20(...)` | `ERC20("Gold Coin", "GLD")` |
| **#3 Initial supply** | The number `1_000_000` (leave `* 10 ** decimals()` alone) | `500_000` |
| **#4 Decimals** *(optional)* | Uncomment the `decimals()` function and set the return value | `return 6;` |

> **Note on supply:** Keep the `* 10 ** decimals()` part exactly as is. It converts your whole-token count into the base units the blockchain stores, and it stays in sync automatically if you change decimals.

A finished example:

```solidity
contract GoldCoin is ERC20 {
    constructor()
        ERC20("Gold Coin", "GLD")
    {
        _mint(msg.sender, 500_000 * 10 ** decimals());
    }
}
```

## Step 4 — Compile

Click the **Solidity Compiler** tab (left sidebar, looks like an "S"). Click the blue **Compile** button. Remix auto-fetches the OpenZeppelin import — no setup needed. A green checkmark means success.

## Step 5 — Open the Deploy tab

Click the **Deploy & Run Transactions** tab (Ethereum logo / arrow icon, below the compiler).

## Step 6 — Connect MetaMask

In the Environment dropdown, select the Browser extension option for MetaMask — once connected and on the right network, it shows as Sepolia testnet - MetaMask. MetaMask will pop up asking to connect — approve it.

✅ Check two things before deploying:

MetaMask is set to the Sepolia network (not Ethereum Mainnet!)
The Account field in Remix now shows your wallet address and a small Sepolia ETH balance

## Step 7 — Deploy

Confirm your contract appears in the **Contract** dropdown, then click the orange **Deploy** button. MetaMask will pop up showing the gas fee — click **Confirm**.

Wait a few seconds for the transaction to be mined. You'll see it confirm in the Remix terminal at the bottom.

> ⚠️ **Real testnet = real waiting.** Unlike the in-browser VM, this is a live network. Deployment takes a few seconds and costs (test) gas. If MetaMask says you have insufficient funds, top up from a faucet (see Setup).

## Step 8 — View it on the block explorer

In the Remix terminal, click the transaction to expand it and copy the **contract address**. Paste it into [sepolia.etherscan.io](https://sepolia.etherscan.io) to see your token live on a public blockchain. 🎉

You can also expand your contract under **Deployed Contracts** in Remix and click the blue read buttons to verify:

- **name** → your full name
- **symbol** → your ticker
- **totalSupply** → your supply (with all the decimal zeros)
- **decimals** → 18, or whatever you set

## Step 9 — Check your balance

Click **balanceOf**, paste your address (copy it from the **Account** field near the top of the panel), and click. You'll see your full supply.

> **Why the giant number?** With 18 decimals, 1,000,000 tokens is stored as `1000000000000000000000000`. Divide by 10¹⁸ to get back to the token count you expected — just like cents vs. dollars.

## Step 10 — Add your token to MetaMask & transfer

**See it in your wallet:** In MetaMask, go to **Tokens → Import tokens**, paste your contract address, and your token appears with its symbol and balance.

**Send some:** Click **transfer** in Remix (or use MetaMask's Send), enter a recipient address and an amount, and confirm in MetaMask. Watch the balance move on-chain. 🎉

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Compiler error about version | Make sure the compiler version matches `^0.8.20` |
| Supply looks tiny / like a decimal | You probably removed `* 10 ** decimals()` — put it back |
| Import won't resolve | Check the import path spelling; Remix needs internet to fetch it |
| Contract not in dropdown | Compile first (Step 4), then return to the Deploy tab |
| MetaMask won't connect | Make sure the extension is unlocked and you picked **Injected Provider - MetaMask** |
| "Insufficient funds" on deploy | You need Sepolia test ETH — get some from a faucet (see Setup) |
| Deployed to wrong network | Switch MetaMask to **Sepolia** and redeploy |
| Transaction stuck / pending | Sepolia can be slow; wait, or speed it up in MetaMask |

## Learn more

- [OpenZeppelin ERC-20 docs](https://docs.openzeppelin.com/contracts/erc20)
- [Remix documentation](https://remix-ide.readthedocs.io)
- [ERC-20 standard (EIP-20)](https://eips.ethereum.org/EIPS/eip-20)
- [Sepolia block explorer](https://sepolia.etherscan.io)
