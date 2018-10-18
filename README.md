<div align="center">
  <img src="https://raw.githubusercontent.com/enKryptIO/ethvm/master/.github/assets/logo.png" alt="ethvm-logo">
  <p>:zap::zap::zap: EthVM Project: An open source blockchain explorer for Ethereum network :zap::zap::zap:</p>
  <p>Powered by <a href="https://www.typescriptlang.org/">TypeScript</a> / <a href="https://github.com/socketio/socket.io">Socket.io</a> / <a href="https://github.com/ethereum/ethereumj">EthereumJ</a> / <a href="https://kafka.apache.org/">Kafka</a> / <a href="https://github.com/mongodb/mongo">MongoDB</a> / <a href="https://redis.io/topics/quickstart">Redis</a></p>
</div>

# EthVM: Open Source Ethereum Blockchain Explorer

![Screenshot example](.github/assets/ethvm.png)

## Philosophy

We have strong foundations on how an Open Source explorer should be:

- **Empower the people**: Give people the ability to inspect the Ethereum blockchain (and other related networks) easily, pretty much like [etherscan](https://etherscan.io/) does (but without being closed source).
- **Open source & audit-able**: Having an open source foundation, will guarantee free access to inspect, audit and modify whatever you want or need, without any vendor lock-in.
- **People are the Priority**: People are the most important & their experience trumps all else. If monetization worsens the experience, we don't do it. (e.g. ads).
- **A learning experience, too**: We want to educate about Ethereum, security, privacy, the importance of controlling your own keys, how the blockchain works, and how Ethereum and blockchain technologies enable a better world.
- **Private**: No tracking!!! No emails. No ads. No demographics. We don't even know who / what / where you are.

## EthVM Project Structure

This repository holds a mirage of different subprojects that in conjuction forms EthVM (we are following the [monorepo](https://medium.com/@maoberlehner/monorepos-in-the-wild-33c6eb246cb9) way of living). All of them are located under `apps/` folder:

| Directory               | Written in | Purpose                                                                                                                                                                                                                                                                     |
|:------------------------|:-----------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| `apps/bolt`             | Kotlin     | A Kafka Streams blockchain processing application (EthVM core element).                                                                                                                                                                                                     |
| `apps/contracts`        | Solidity   | A set of contracts that helps to obtain tokens balances for a particular address.                                                                                                                                                                                           |
| `apps/ethereumj`        | Java       | A forked version of [`ethereumj`](https://github.com/enKryptIO/ethereumj) that processes / listens to Ethereum events. This project is kept as a `git sumbodule` as it will connstantly be updated as main changes are introduced in the main branch of `ethereumj`.        |
| `apps/ethvm`            | VueJs      | Main frontend website where users navigate to explore the Blockchain.                                                                                                                                                                                                       |
| `apps/server`           | NodeJs     | A Socket reactive API that the frontend uses to communicate with the Blockchain.                                                                                                                                                                                            |

Also, there are a couple of different directories, not related itself to any concrete subproject, that lives in the parent one:

| Directory                         | Written in          | Purpose                                                                                                                                                                                                                                        |
|:----------------------------------|:--------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| `bin`                             | NodeJs / Bash       | Contains helper scripts that aids in different aspects of the development. Also, there's one script called `monkey-cli` that helps to produce fake blocks / txs and contract deployments for testing purposes.                                 |
| `postman`                         | Postman (Js)        | A simple Postman collection that contains all `ethereum` JSON RPC calls. Very useful for testing our custom geth node.                                                                                                                         |
| `provisioners`                    | Kubernetes / Docker | Contains kubernetes definitions for deploying a production ready EthVM project (work in progress, though). Also, it contains `docker` development images (that differs slightly from production ready `dockerfiles`) needed for development.   |
| `docker-compose.yml`              | Docker              | This `docker-compose` file contains the basis services necessary for local development                                                                                                                                                         |
| `docker-compose.traefik.yml`      | Docker              | Adds Traefik proxy support to the local services                                                                                                                                                                                               |    
| `docker-compose.processing.yml`   | Docker              | Adds bolt and ethereumj services compiled from source                                                                                                                                                                                          |

## Getting Started

For more information on how you can setup your environment, visti our [Wiki](https://github.com/enKryptIO/ethvm/wiki/) for more information.

## Contributing

We welcome every kind of contribution, so, please see [CONTRIBUTING](.github/CONTRIBUTING.md) for more details on how to proceed.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

<div align="center">
  <img src="https://forthebadge.com/images/badges/built-with-love.svg" alt="built with love by enKryptIO team" />
</div>
