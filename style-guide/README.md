---
description: TODO
---

# Style Guide

## Working together

* If something doesnt make sense, make a comment using GitBook, or ask in the Discord.
* If you are confident that something is wrong, just fix it. There's no need to ask. 
* If you think something doesnt have enough detail, expand on it, or leave a comment suggesting that.
* If a page is getting too long, break it down into new pages. If you're unsure, then leave a comment or talk in the discord
* If you want to write about something new and learn as you type, this is fine! But **please** leave a warning at the top that this is new to you and needs another pair of eyes.
* If there's big subject you're working on, claim the page and save it, show us that that's what you're doing so we don't overlap too much

## General Tips

* Introduce new objects slowly, if many things need to be assumed, then try to plan for them to appear within the [Book Plan](../todo.md) somewhere. 
* It is better to cover less, and explain something well, than it is to quickly cover a lot. We're not racing
* When explaining anything, imagine you are introducing it for a first time. Summaries exist elsewhere online, the goal of CryptoBook is education
* Contribute as much or as little as you want, but try to only work on topics that
  * You are interested in
  * You have some experience of thinking about
* External resources should be included at the end of the page. Ideally the book should be self-contained \(within reason\) but other resources are great as they offer other ways to learn

{% hint style="warning" %}
If anything on any page is unclear, then please leave a comment, or talk in the discord. We are all at different levels, and I want this to be useful for everyone. Let's work on this as a big team and create something beautiful.
{% endhint %}

* Try and use the hints / tips blocks to break up dense text, for example:

{% hint style="info" %}
To use $$\LaTeX$$, you can wrap your text in `$$maths here$$.` If this is at the beginning of a paragraph, it makes it block, otherwise it is inline
{% endhint %}

## Page Structure

* A page should have a clear educational goal: this should be explained in the introduction. References to prerequesites should be kept within the book and if the book doesnt have this yet, it should be placed into [Book Plan](../todo.md).
* The topic should be presented initially with theory, showing the mathematics and structures we will need. A discussion should be pointed towards how this appears within Cryptography

{% hint style="success" %}
Motivating a new reader is the biggest challenge of creating a resource. People will be coming here to understand cryptography and SageMath, so keep pointing back to the goal!
{% endhint %}

* Within a discussion of a topic, a small snippet of code to give an example is encouraged
* If you write code better than you write maths, then just include what you can and the page will form around that
* An example page is given in [Sample Page](sample-page.md)

## Formatting

### Mathematics notation

There's no "right or wrong" but it's good to be consistent, I think?

* All maths must be presented using $$\LaTeX$$using either both block and inline
* We seem to be using `mathbb` for our fields / rings. So let's stick with that? Maybe someone has a good resource for notation we can work from?

### Code Blocks

* Make sure all code blocks have the right language selected for syntax highlighting
* Preference is to SageMath, then to Python, then others. 



