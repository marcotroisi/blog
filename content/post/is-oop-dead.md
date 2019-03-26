---
author: Marco Troisi
categories:
- Software Development
- OOP
date: 2016-11-22T08:16:23Z
description: Object orientation produces code that is well organized, and easy to understand, test, and refactor. But it&#039;s misunderstood.
draft: false
featured_image: 'https://www.marcotroisi.com/images/is-oop-dead.jpeg'
layout: post
tags:
- technology
- oop
- code-quality
- object oriented programming
- programming
title: Is object oriented programming dead? Not by a long shot
url: /object-oriented-programming-is-not-dead/
---

Is object-oriented programming (OOP) any good, really? If not, is it just plain bad, or are we simply not doing it right? Are OOP [languages even in your future](http://techbeacon.com/13-programming-languages-defining-future-coding)?

You've learned about OOP, and you've probably done it, or at least you think you have. You listened to other people tell you that it's the right way—or the wrong way—to do things. You've spent long, excruciating hours listening to your computer science teacher talking about how "Toyota" inherits from "car," and so on.

In real life, though, you may not have found it useful. Perhaps you've worked with OOP languages, and at times it seemed more like a restriction than something that actually helps. Perhaps it has bothered you so much that you've welcomed the arrival of different and more modern paradigms.

You probably identify with at least some of the above sentences. So you may be asking yourself: 

## Why OOP?

I enjoy writing code in an object-oriented fashion. Thinking in terms of objects gives me a model that, when followed consistently,  produces code that is well organized, and easy to understand, test, and refactor.

Some people argue that OOP doesn't really work, or that you don't need it to build modern software. But while I don't think OOP is the ultimate paradigm, it is helpful. A bunch of procedural code, however nicely organized, is simply not the answer.

But what about functional programming, you might say? That's all fine and good. Many people say OOP and functional programming don't *necessarily* conflict with each other. In fact, they complement each other.

## Understanding OOP, polymorphism and immutability

Robert Martin has argued that the [biggest benefit you can take from OOP](http://blog.cleancoder.com/uncle-bob/2014/11/24/FPvsOO.html) is polymorphism, the notion that you can define a single interface with multiple underlying implementations. As software engineers, we wouldn't want to lose that. One of polymorphism's many benefits is that lets you attain *inversion of dependency*. In OOP, this means that "both high- and low-level objects must depend on the same abstraction," according to Wikipedia. In practice, this translates into software components that are no longer highly coupled. Each component, both high-level and low-level ones, can be easily replaced.

Martin further states that the biggest benefit you can take from functional programming is immutability, the idea that we design functions or objects so that they always return the same result, given the same values as parameters. Much has been said about this topic, and it's apparent that its many advantages, such as code maintainability and lack of side effects, far outweigh possible downsides, such as a lack of flexibility of sort.

It shouldn't come as a surprise, then, that immutability has been a recurring theme among people who have done OOP for a while. In his book, Effective Java, Joshua Bloc says that "Classes should be immutable unless there's a very good reason to make them mutable... If a class cannot be made immutable, limit its mutability as much as possible."

[Yegor Bugayenko](http://www.yegor256.com/), CTO of teamed.io, is one of the strongest advocates of a return to pure OOP. He writes extensively about the [advantages of immutability](http://www.yegor256.com/2014/06/09/objects-should-be-immutable.html), saying that "...all classes should be immutable in a perfect object-oriented world."

There is a lot more to it, and Yegor himself recently wrote a clarifying article, "[Gradients of immutability](http://www.yegor256.com/2016/09/07/gradients-of-immutability.html)," where he explains how an immutable object doesn't always need to have a rigid structure.

This is a big topic, worthy of further study. But by now it should be clear that one good reason to do OOP is so you can retain polymorphism. Not only is that possible, but many people recommended it. While we do OOP, we should also hold on to as much immutability as possible, thereby bringing the single biggest advantage of functional programming into OOP.

If we could get back to the primary advantages of OOP,  and get rid of all of the unnecessary ideas that have cluttered it to the point where most programmers have felt like OOP had become counterproductive, we could add more value to the way we write software.

I'll get back to what this type of stripped-down, or pure OOP, looks like in a minute. But the fact is that real OOP may look quite a bit different from the way you have understood it up to now.

At this point, it's worth asking the question: why objects? Why do we need to design programs as a number of objects, as opposed to functions, or procedures?

## Use objects as a way to understand the world

David West, the author of "[Object Thinking](http://amzn.to/2e4s5FM)," said in a recent [interview](https://www.youtube.com/watch?v=bW5K5cJ-AVs) that "You look at the world around you and you don't see functions, but you see objects." He's on solid ground here: Philosophers have used terms like *abstract* and *concrete objects* to describe the world around them for a long time.

Objects begin to make sense once we stop thinking in terms of bits and bytes, or lines of code. Thinking in terms of objects also lets us stop seeing ourselves as simply people who write code. Our job is really about solving problems, and finding meaningful ways to represent the domain in which we operate. It's a completely different approach from the one that most people take when writing software. It's the notion that ["programs must be written for people to read, and only incidentally for machines to execute,"](https://mitpress.mit.edu/sicp/full-text/sicp/book/node3.html) as Harold Abelson, Gerald Jay Sussman and Julie Sussman state in their book, *[Structure and Interpretation of Computer Programs](https://mitpress.mit.edu/sicp/full-text/sicp/book/book.html)*.

Thinking in an object-orientated way is a great way to understand the problem you are trying to solve. It allows you to build software that is more maintainable, and easily understandable, for other people.

By contrast, when you write code in a procedural way, you're really putting yourself in the computer's shoes, so to speak, and writing lines of code in the way it will eventually receive your commands anyway. That's convenient, if you're writing a quick 10-lines-long script, but less so if you're building a complex system on which many programmers must work. Eventually, common sense says you should somehow organize this code into smaller chunks, each containing a different set of procedures (or functions) and representing a distinct domain of sort. In the end, hardly any of this will feel natural, or even logical.

In this case, had the programmer originally designed the software in an object-oriented fashion, instead of having a lump of disorganized code, the software would be well structured and easy to understand. This isn’t necessarily a bad thing for the computer, as often code that's well written and easy to understand is fast to execute, with less chance of memory leaks.

## The source of all that OOP criticism

The problem with a lot of the [OOP criticism](https://mcollina.github.io/we-are-not-object-oriented-anymore/) out there is that it tends to refer to things that in popular programmer culture have become associated with OOP, but shouldn't be.

One example is [object-relational mapping](http://marcotroisi.com/healthy-oop-object-oriented-programming/#orm-no-thanks) (ORMs). Truthfully, you could drop the "O" in this acronym, as there is no way to directly represent a relational database table in a real-world object. Then there's [accessors and mutators](http://marcotroisi.com/healthy-oop-object-oriented-programming/#accessors-and-mutators-vs-useful-methods) (or [getters and setters](http://www.javaworld.com/article/2073723/core-java/why-getter-and-setter-methods-are-evil.html)) as they will inevitably change the face of your object into a big "data bag," throwing encapsulation and data abstraction out the window. The [absence of interfaces](http://www.yegor256.com/2014/11/20/seven-virtues-of-good-object.html#2-he-works-by-contracts) is one of the main causes for tight coupling (or lack of flexibility) in our code. Finally, [static methods](http://www.yegor256.com/2014/11/20/seven-virtues-of-good-object.html#5-his-class-doesn-39-t-have-anything-static) turn what may have started as an object into a big collection of functions, or procedures, which was never OOP's purpose. 

Quite a few practices have somehow become part of our daily work but were never supposed to be found in OOP. In fact, using them takes us very far from truly object-oriented code. As a result, we lose out on many of the advantages we could have experienced.

If you were to take a codebase and eliminate at least two of the above mentioned practices, the face of your code would experience a noticeable change for the better.

OOP done well comes with a lot of benefits. But it's absolutely necessary to remind ourselves what it is that OOP really is, and free ourselves from the many bad practices that have nothing to do with true object thinking.

***

***This article was first published on [TechBeacon](http://techbeacon.com/object-oriented-programming-dead-not-long-shot).***
