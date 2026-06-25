#let title = "Style Guide"
#let summary = "Work in progress"
#import "/callout.typ": warning, info, success

= Working together

- If something doesn't make sense, ask in the Discord or open an issue.
- If you are confident that something is wrong, just fix it. There's no need to ask.
- If you think something doesn't have enough detail, expand on it, or leave a comment suggesting that.
- If a page is getting too long, break it down into new pages. If you're unsure, then leave a comment or talk in the discord
- If you want to write about something new and learn as you type, this is fine! But *please* leave a warning at the top that this is new to you and needs another pair of eyes.
- If there's big subject you're working on, communicate and show us that that's what you're doing so we don't overlap too much

= General Tips

// TODO: Improve page linking by with automatic title insertion
- Introduce new objects slowly, if many things need to be assumed, then try to plan for them to appear within the #link(<doc::todo>)[Book Plan] somewhere.
- It is better to cover less, and explain something well, than it is to quickly cover a lot. We're not racing
- When explaining anything, imagine you are introducing it for a first time. Summaries exist elsewhere online, the goal of CryptoBook is education
- Contribute as much or as little as you want, but try to only work on topics that
  - You are interested in
  - You have some experience of thinking about
- External resources should be included at the end of the page. Ideally the book should be self-contained (within reason) but other resources are great as they offer other ways to learn

#warning[
    If anything on any page is unclear, then please leave a comment, or talk in the discord. We are all at different levels, and I want this to be useful for everyone. Let's work on this as a big team and create something beautiful.
]

- Try and use the hints / tips blocks to break up dense text, for example:

#info[
    To use math, you can rely on the #link("https://typst.app/docs/reference/math/")[standard typst math handling].
]

= Page Structure

- A page should have a clear educational goal: this should be explained in the introduction. References to prerequisites should be kept within the book and if the book doesnt have this yet, it should be placed into #link(<doc::todo>)[Book Plan].
- The topic should be presented initially with theory, showing the mathematics and structures we will need. A discussion should be pointed towards how this appears within Cryptography

#success[
    Motivating a new reader is the biggest challenge of creating a resource. People will be coming here to understand cryptography and SageMath, so keep pointing back to the goal!
]

- Within a discussion of a topic, a small snippet of code to give an example is encouraged
- If you write code better than you write maths, then just include what you can and the page will form around that
// - An example page is given in [Sample Page](sample-page.md) // TODO

= Formatting

== Mathematics notation

There's no "right or wrong" but it's good to be consistent, I think?

- All maths must be presented using proper (inline or block) math notation
- We seem to be using `bb` for our fields / rings. So let's stick with that? Maybe someone has a good resource for notation we can work from?

== Code Blocks

- Make sure all code blocks have the right language selected for syntax highlighting
- Preference is to SageMath, then to Python, then others. // TODO: Add sagemath syntax definition
- Code should be copy-pastable. So if you include print statement, include the result of the output as a comment

== Algorithms

- Algorithms should be presented as??

```text
// todo
```
