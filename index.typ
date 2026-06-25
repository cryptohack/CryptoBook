// TODO: Not optimal to have README.md duplicated like this, we can probably use a package to render it instead
#let title = "CryptoBook"

= About this project

CryptoBook is a community project, developed by members of #link("https://cryptohack.org")[CryptoHack] to create a resource for people to learn cryptography. The focus of this project is to create a friendly resource for the mathematical fundamentals of cryptography, along with corresponding #link("https://www.sagemath.org")[SageMath] implementation.

Think of this as an alternative SageMath documentation source, where the focus is its application in solving cryptographic problems.

If you're interested in contributing, come chat to us in our #link("https://discord.gg/eJaJ3xC")[Discord Channel].


= Using typst

First, install #link("https://typst.app")[typst] version >= 0.15.
To build everything, run `typst compile --features html,bundle --format bundle root.typ dist`, which places all files in the directory `dist`.
Replacing `compile` with `watch` will run a local web server with live reload.

