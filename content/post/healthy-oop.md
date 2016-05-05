---
author: Marco Troisi
categories:
- Software Development
- Php
- Opinions
date: 2016-04-29T08:34:57+01:00
description: Brief description of the article
draft: true
featured_image: '** remove this if not present **'
layout: post
tags:
- OOP
- object oriented programming
title: Healthy OOP
url: /new-post-url/
---
I enjoy writing code in an Object Oriented fashion. Thinking in terms of objects gives me
a model that, when followed consistently, ends up giving me code that is well organised,
and that I know to be relatively easy to understand, test and refactor.

Now [some people](https://mcollina.github.io/we-are-not-object-oriented-anymore/
) would want to argue that OOP doesn't really work and/or that we don't need it anymore
to build modern software, and why I by no means think or want to say that OOP is the ultimate
paradigm, I would definitely want to maintain that *it is* helpful and that no, a bunch of
procedural code, however *nicely* organised, *is not* the answer.

The problem with a lot of the criticism that OOP gets, is that it tends to refer to things that in
popular programmer culture have become somehow associated with OOP, while that isn't really the case.

Object Oriented Programming done well, or what I call **Healthy OOP*, comes with a lot of benefits.
Here's a number of things everyone need to know in order to write healthy OOP.

## ORM? No, thanks

The main problem with ORM used in an Object Oriented software is, to put it simply, that ORM-related
code is, overwhelmingly, not Object Oriented. I am not saying it is bad per se, and I am not buying into
[Orm Hate](Martin Fowler Orm Hate) just for the sake of it. But, at least from an Object Oriented perspective,
using an ORM is probably not the smartest choice out there.

In my opinion, the *biggest issue here* is that you are encouraged to create what you are told to be objects,
and use them as *mappers* to a database table (or collection). While this may sound very convenient
on paper, in practice it will inevitably lead you to create big classes, as big as your database tables.

Not only that, but it will encourage you to skip the "thinking" process, or the architectural side of things.
In other words, when all you have to do is to replicate the exact same structure of your tables into classes
(and please don't make the mistake to think of them as objects, because they are not), and when most of this is
probably done for you by some sort of automatic *table-to-class* generator, then there is almost no point
in which sitting down and thinking through what's the appropriate architecture and the best organisation for the
software makes sense.

Database tables are meant to be relatively big collections of data, in a structured and easy-to-query fashion. There is
very little correlation between that and your Objects, which are supposed to be kept small, cohesive, easy to extend,
refactor, manipulate. Not to mention the need to keep your [*architecture clean*](https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html), which won't happen if you start
tightening up your code with whichever database you've decided to use. It will eventually cause [technical debt](http://marcotroisi.com/technical-debt-is-not-a-unicorn/), and that simply tells you something went wrong
at an architectural decision level.

So there is a case to be made against the use of ORMs in general, but that is even more so if you're doing OOP.

A note of clarification is due here: if you're building software with a clean architecture, and you really, really want to use
an ORM, there may be a place for it, and that's at the level of the *Interface Adapters*, where you would build proper interfaces
between your Objects (at the *Entities* and *Use cases* levels) and your ORM "mappers".

Personally, my favourite approach would be to build [SQL-speaking Objects](http://www.yegor256.com/2014/12/01/orm-offensive-anti-pattern.html).

At any rate, if you decide to go with an ORM, that's entirely your prerogative, and it's not wrong per se. But make sure
you're building things in a *clean* fashion, and don't use the ORM-generated mappers as your main objects. A decent approach would
probably to have your *ORM-speaking objects*, or in other words, objects into which the appropriate ORM mappers are injected (as
opposed to injecting a database connection library or something of that sort).

## Accessors and mutators vs useful methods

*Accessors* and [*mutators*](https://en.wikipedia.org/wiki/Mutator_method),
also known as getters and setters, are incredibly popular today. Most IDEs will even
automatically generate them for you, which make them even more tempting, as you can
have them there and ready to use in a couple of seconds. Why then take the time to think
about more appropriate, expressive and useful methods? There are a few advantages:

1. It makes your Object closer to a real-world entity.
2. You don't need to expose all of your internal variables.
3. As a representation of a real world entity, your object should be able to do more
than just exposing a bunch of variables through getters and setters.

Ultimately and probably the biggest benefit is that by following this approach you
are always going to force yourself to think about the internal architecture of your object,
not delegating its functionalities to automatically generated getters and setters,
but possibly exposing only relevant information via nice and expressively named methods.

A great approach to doing this is to first **create an interface** where you would define
all the methods that will be exposed by your object. Then, create your object,
making it implement the interface you just defined, and then start filling those methods
with actual functionalities, all the while writing your tests for the methods you are
working on.

## Strive to represent real world entities, not bags of data

...

## Further reading:

* [Why getter and setter methods are evil](http://www.javaworld.com/article/2073723/core-java/why-getter-and-setter-methods-are-evil.html) - Allen Holub
