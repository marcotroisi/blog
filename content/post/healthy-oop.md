---
author: Marco Troisi
categories:
- Software Development
- Php
- Opinions
date: 2016-04-29T08:34:57+01:00
description: Brief description of the article
draft: true
#featured_image: '** remove this if not present **'
layout: post
tags:
- OOP
- object oriented programming
- Php
- Javascript
- Golang
title: Healthy OOP
url: /healthy-oop-object-oriented-programming/
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
probably be that of having your *ORM-speaking objects*, or in other words, objects into which the appropriate ORM mappers are injected (as
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

## Strive to represent real world entities, not bags of data

This is a point that I keep coming back to: take the time to **think about your objects** and the
overall architecture.

You should think of your objects as **real world entities**, rather than data structures or "helpers".
So, again, instead of replicating your database tables, think about real world examples that
would make sense in your case, and expose real behaviour, rather than a bunch of accessors.

Instead of building a `class PasswordEncrypter` that takes in passwords and encrypts them
using the algorithm of choice, think in terms of small, more maintainable, composable and extendable objects.

Why not defining a simple interface like this:

```
type EncryptedPasswordInterface interface {
  func decriptedValue() string;
}
```

and then have simple, small classes using that interface to encrypt a given password using a certain algorithm. Like this:

```
type Sha1EncryptedPassword struct {
  var encryptedPassword string;  
}
func (p *Sha1EncryptedPassword) encryptedValue() string {
  // here encrypt your password with sha1 and return value
}
```

You could also have another class that looks like this:

```
type Sha1EncryptedPasswordWithSalt struct {
  var encryptedPassword string;
}
func (p *Sha1EncryptedPasswordWithSalt) encryptedValue() string {
  // here encrypt your password with sha1 and return value
}
```

See how simple it is? Following this approach, you'll never end up with overbloated, ever-growing "Services".

The main point here is that you want to build in a way that allows you to keep things always small, always composable,
always breakable into smaller pieces. The problem with a `PasswordEncrypter` would have been that even if
at the beginning it supported only one encryption algorithm, the number of such algorithms could have grown with time,
and there would have been no obvious way to break things into smaller pieces.

Notice that I am not saying that it couldn't have been done, what I am saying is that there wouldn't have been an obvious
way to do it, which is after all my main point of contemption with OOP: it's a *system* that gives you a more obvious way to
consistently keep your code organised, easy to break into smaller pieces, easy to understand.

In the example above, the real world entity is the *encrypted password*, as defined by the initial interface. It is very easy to
imagine that this password could have been encrypted with as many encryption algorithms as you can think of, and all you need to do
is to have an object representing each one of those algorithms. Want to encrypt a password with an algorithm on top of another one?
Create an object for it (probably the best approach), or do something like this:

```
md5Password := NewMd5EncryptedPassword(unencryptedPassword);
encryptedPassword := NewSha1EncryptedPassword(md5Password.encryptedValue);
```

In the above example, `encryptedPassword` will have double encryption, MD5 and SHA1. A different approach would be
to build a *decorator*, which is an invaluable tool in OOP. It would look like this:

```
// Constructor for Sha1PasswordFromMd5
func NewSha1PasswordFromMd5(md5EncryptedPassword *EncryptedPasswordInterface) (p *Sha1PasswordFromMd5) {
  return &Sha1PasswordFromMd5{md5EncryptedPassword};
}
// Sha1PasswordFromMd5 is a decorator that takes as an argument EncryptedPasswordInterface and returns
// this value with Sha1 encryption
type Sha1PasswordFromMd5 struct {
  var md5EncryptedPassword *EncryptedPasswordInterface;
}
func (p *Sha1PasswordFromMd5) encryptedValue() string {
  // here encrypt md5EncryptedPassword with sha1 and return value
}
```

These are all examples of course, and you would have to use the best approach that works for what you're trying to build.

## Use interfaces

Interfaces can be a controversial topic. Oddly enough, I've found myself having to justify the use of interfaces or making
the case for them to other developers more often that it would have been reasonable to.

Unfortunately, some languages (see Javascript) don't even come with first class support for interfaces (although the
excellent Typescript [does](http://www.typescriptlang.org/docs/handbook/interfaces.html)), whereas in some other languages,
like PHP, interfaces were a later addition and many developers don't seem to have ever taken the time to study the matter
and understand what the use cases for them are. Golang has had support for interfaces since the beginning, and the use of them
seems to be part of the language's *ethos*.

There are many reasons to use interfaces. Personally, I tend to create an interface for virtually every object that I create.
This has several benefits:

- It allows me to define *what the object does* without having yet to worry about actual implementation of functionalities and related tests
- It makes writing tests **very easy**
- By defining the *signatures* of your object, I'm forcing it to adhere to a **contract** of sort, as my
object's public methods will all be described by a previously designed interface.
- It makes it easier to avoid violations of the *[Interface Segregation Principle](https://en.wikipedia.org/wiki/Interface_segregation_principle)*
- It gives me the flexibility to quickly *swap one object for another*, as long as the interface adopted is the same

***

### Further reading:

* [Why getter and setter methods are evil](http://www.javaworld.com/article/2073723/core-java/why-getter-and-setter-methods-are-evil.html) - Allen Holub
