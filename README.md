# Udacity Blockchain Capstone

The capstone will build upon the knowledge you have gained in the course in order to build a decentralized housing product. 

You can see the published contracts here:

- [RealEstateToken contract address](https://rinkeby.etherscan.io/address/0xBc296BaEdaA8880C0a15C721d042f542Dc78B57E)
- [Verifier contract address](https://rinkeby.etherscan.io/address/0x349822CCf9383B112C468d4aDAEe1dd58A6C6Bde)
- [SolnSquareVerifier contract address](https://rinkeby.etherscan.io/address/0x1E6FAb388d88B77DB7b3C444ACe4C2e32c523c54)

And, you can see the tokes on OpenSea:

- [OpenSea Seller](https://testnets.opensea.io/accounts/0x7E7b32D8F5BC643f7C32161bA645ea01203b4b6C)
- [OpenSea Buyer](https://testnets.opensea.io/accounts/0x4e4a6f778d7e4f47bbea4792d14539078f87bd10)

---

# Local Development
The project is divided into a backend that publishes _smart contracts_ to the _Ethereum network_, and a frontend In OpeSea.

## Set Up
### Prerequisites
Please make sure you've already installed ganache-cli, Truffle and enabled MetaMask extension in your browser.

Truffle is a development environment tha manage the contract artifacts.
The right version is included in the `package.json` so you only need to download the dependencies

```shell
# install all dependencies
$ npm install
```

To sync a MetaMask wallet you should create a `.secret` file and add the mnemonic as plain text

```shell
# create the file that will contain the MetaMask mnemonic
touch .secret
```

## Build
### Backend
To generate the contracts artifacts and deploy them to a local blockchain network using truffle, run:
```shell
# start a local network and run the truffle console
$ truffle console
# or if you don't have ganache running
$ truffle develop
# creates the bytecode and the ABI
> compile
# deploys the contracts to the local network
> migrate --reset
```

## Run Tests
The test should be run after the contract is migrated
```shell
$ truffle test
```

---

# Deployment

## Publish
Publishing the _smart contract_ into a public network requires a wallet with Ether, and an Infura account.
Store the mnemonic of the wallet with founds in the `.secret` file

```shell
# publish into rinkeby test network
truffle migrate --reset --network rinkeby
```

---

# Project Resources

* [Remix - Solidity IDE](https://remix.ethereum.org/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Truffle Framework](https://truffleframework.com/)
* [Ganache - One Click Blockchain](https://truffleframework.com/ganache)
* [Open Zeppelin ](https://openzeppelin.org/)
* [Interactive zero knowledge 3-colorability demonstration](http://web.mit.edu/~ezyang/Public/graph/svg.html)
* [Docker](https://docs.docker.com/install/)
* [ZoKrates](https://github.com/Zokrates/ZoKrates)
