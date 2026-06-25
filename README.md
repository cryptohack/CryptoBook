# CryptoBook

## About this project

CryptoBook is a community project, developed by members of [CryptoHack](https://cryptohack.org) to create a resource for people to learn cryptography. The focus of this project is to create a friendly resource for the mathematical fundamentals of cryptography, along with corresponding [SageMath](https://www.sagemath.org) implementation.

Think of this as an alternative SageMath documentation source, where the focus is its application in solving cryptographic problems.

If you're interested in contributing, come chat to us in our [Discord Channel](https://discord.gg/eJaJ3xC)


## Using typst

First, install [typst][https://typst.app] version >= 0.15.
To build everything, run `typst compile --features html,bundle --format bundle root.typ dist`, which places all files in the directory `dist`.
Replacing `compile` with `watch` will run a local web server with live reload.

