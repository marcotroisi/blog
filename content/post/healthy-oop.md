---
author: Marco Troisi
categories:
- Software Development
- Php
- Opinions
date: 2016-04-29T08:34:57+01:00
description: Brief description of the article
draft: false
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
) would want to argue that OOP doesn't really work and/or that we don't need it anymore to build modern software, and why I by no means think or want to say that OOP is the ultimate paradigm, I would definitely want to maintain that *it is* helpful and that no, a bunch of procedural code, however *nicely* organised (even if that means [microservices](http://marcotroisi.com/microservices-wont-improve-your-code-quality/)), *is not* the answer.

The problem with a lot of the criticism that OOP gets, is that it tends to refer to things that in popular programmer culture have become somehow associated with OOP (like the use of ORM), while that isn't really the case.

Object Oriented Programming *done well*, or what I call **Healthy OOP**, comes with a lot of benefits. Here's a number of things everyone needs to know in order to write good quality code in an OOP way.

## ORM? No, thanks

The main problem with using an ORM in an Object Oriented software is, to put it simply, that ORM-related code is, overwhelmingly, not Object Oriented. I am not saying it is bad per se, and I am not buying into [Orm Hate](Martin Fowler Orm Hate) just for the sake of it. But, at least if you're trying to write good quality Object Oriented code, using an ORM is probably not the smartest choice out there.

The biggest issue here is that when you use an ORM you are encouraged to create what you are told to be objects, and use them as *mappers* to a database table (or collection). While this may sound very convenient
on paper, in practice it will inevitably lead you to create big classes, at least as big as your database tables.

Not only that, but it will also encourage you to skip the "thinking" process, or the architectural side of things.
In other words, when all you have to do is to *replicate* the exact same structure of your tables into classes (and please don't make the mistake to think of them as objects, because they are not), and when most of this is
probably done for you by some sort of automated *table-to-class* generator, then there is almost no point in which it makes sense to sit down and thinking through what's the appropriate architecture and the best organisation for the software. You're going to create a bunch of classes that represent your tables, and you'll just work with them as they are.

But database tables are meant to be relatively big collections of data, in a structured and easy-to-query fashion. There is very little correlation between that and your Objects, which are supposed to be kept small, cohesive, easy to extend, refactor and manipulate. Not to mention the need to keep your [*architecture clean*](https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html), which won't happen if you start tightening up your code with whichever database you've decided to use. It will eventually cause [technical debt](http://marcotroisi.com/technical-debt-is-not-a-unicorn/), and that simply tells you something went wrong at an architectural decision level.

So there is a case to be made against the use of ORMs in general, but that is even more so if you're doing OOP.

A note of clarification is due here: if you're building software with a clean architecture, and you really, really want to use
an ORM, there may be a place for it, and that's at the level of the *Interface Adapters*, where you would build proper interfaces between your Objects (at the *Entities* and *Use cases* levels) and your ORM "mappers". If you have no idea what I'm talking about here, please do yourself a favour and read Uncle Bob Martin's article on [the clean architecture](https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html).

Personally, my favourite approach would be to build [SQL-speaking Objects](http://www.yegor256.com/2014/12/01/orm-offensive-anti-pattern.html), as suggested by Yegor Bugayenko in both his blog and [his latest book](http://amzn.to/1R0NSpg).

At any rate, if you decide to go with an ORM, that's entirely your prerogative, and it's not wrong per se. But make sure you're building things in a *clean* fashion, and don't use the ORM-generated mappers as your main objects for your business logic.

## Accessors and mutators vs useful methods

*Accessors* and [*mutators*](https://en.wikipedia.org/wiki/Mutator_method),
also known as getters and setters, are incredibly popular today. Most IDEs will even automatically generate them for you, which make them even more tempting, as you can have them there and ready to use in just a few seconds. 

Why then take the time to think about more appropriate, expressive and useful methods? There are a few advantages:

- **It makes your Object closer to a real-world entity.** `Email.enableAutoresponder()` is simply a lot nicer and more expressive than `Email.setAutoresponder(true)`, and it's closer to how you would conceive that operation in the real world
- **You don't need to expose all of your internal variables.** What's the point of having your variables as `private` if you're going to have setters and getters for all of them? You might as well have them all `public`!
The reality is that you often don't need to expose your variables to the outside world.

In OOP, it's better to expose just a limited number of highly focussed and expressive methods, and handle internally everything else.

As a representation of a real world entity, your object should be able to do more than just exposing a bunch of variables through getters and setters.

Ultimately and probably the biggest benefit is that by following a more expressive approach you are always going to force yourself to think about the internal architecture of your object (as opposed to not delegating its functionalities to automatically generated getters and setters) by exposing only relevant information via nice and expressively named methods.

A great approach to doing this is to first **create an interface** where you would define all the methods that will be exposed by your object. Then, create your object, making it implement the interface you just defined, and then start filling those methods with actual functionalities, all the while writing your tests for the methods you are working on.

## Real world entities are better than Services

This is a point that I keep coming back to: take the time to **think about your objects** and the overall architecture.

You should see your objects as **real world entities**, rather than data structures or "helpers".
So, again, instead of replicating your database tables, think about real world examples that would make sense in your case, and expose real behaviour, rather than a bunch of accessors.

Instead of building a `class PasswordEncrypter` that takes in passwords and encrypts them using the algorithm of choice, think in terms of small, more maintainable, composable and extendable objects.

Why not defining a simple interface like this:

```
type EncryptedPasswordInterface interface {
  func decriptedValue() string;
}
```

and then have simple, small classes implementing that interface to encrypt a given password using a certain algorithm.
Something like `Sha1EncryptedPassword`. And then something like `Sha1EncryptedPasswordWithSalt`.

Following this approach, you'll never end up with overbloated, ever-growing "Services", which are really Do-it-all classes, a blatant violation of the *[Single Responsibility Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle)*.

The main point here is that you want to build in a way that allows you to keep things always small, always composable, always breakable into smaller pieces. Your want your objects to be *very specific* and single-focussed.

The problem with a `PasswordEncrypter` would have been that even if at the beginning it supported only one encryption algorithm, the number of such algorithms could have grown with time, and there would have been no obvious way to break things into smaller pieces.

Notice that I am not saying that it couldn't have been done, what I am saying is that there wouldn't have been an obvious way to do it, which is after all my main point of contemption with OOP: it's a *system* that gives you a more obvious way to consistently keep your code organised, easy to break into smaller pieces, easy to understand.

In the example above, the real world entity is the *encrypted password*, as defined by the initial interface. It is very easy to
imagine that this password could have been encrypted with as many encryption algorithms as you can think of, and all you need to do
is to have an object representing each one of those algorithms. Want to encrypt a password with an algorithm on top of another one? Create an object for it (probably the best approach), or do something like this:

```go
md5Password := NewMd5EncryptedPassword(unencryptedPassword);
encryptedPassword := NewSha1EncryptedPassword(md5Password.encryptedValue);
```

In the above example, `encryptedPassword` will have double encryption, MD5 and SHA1. A different approach would be
to build a *[decorator](https://en.wikipedia.org/wiki/Decorator_pattern)*, which is an invaluable tool in OOP. It would look like this:

```go
// Constructor for Sha1PasswordFromMd5
func NewSha1PasswordFromEncrypted(md5EncryptedPassword *EncryptedPasswordInterface) (p *Sha1PasswordFromEncrypted) {
  return &Sha1PasswordFromEncrypted{md5EncryptedPassword};
}
// Sha1PasswordFromEncrypted is a decorator that takes as an argument
// EncryptedPasswordInterface and returns this value with Sha1 encryption
type Sha1PasswordFromEncrypted struct {
  var Md5EncryptedPassword *EncryptedPasswordInterface;
}
func (p *Sha1PasswordFromEncrypted) encryptedValue() string {
  // here encrypt Md5EncryptedPassword with sha1 and return value
}
```

As you can see, `Sha1PasswordFromEncrypted` is a decorator that takes as a parameter an object that implements its very same interface,
`EncryptedPasswordInterface`. It then applies Sha1 encryption on top of the already existing one, and returns the encrypted value as demanded by its interface.

These are all examples of course, and you would have to use the best approach that works for what you're trying to build.
But the main idea is to build objects as representations of real world (not necessarily physical) entities.

## Use interfaces

Interfaces can be a controversial topic. Oddly enough, I've found myself having to justify the use of interfaces or making the case for them to other developers more often that it would have been reasonable to.

Unfortunately, some languages (see Javascript) don't even come with first class support for interfaces (although the
excellent Typescript [does](http://www.typescriptlang.org/docs/handbook/interfaces.html)), whereas in some other languages,
like PHP, interfaces were a later addition and some developers don't seem to have ever taken the time to study the matter
and understand what the use cases for them are. Golang has had support for interfaces since the beginning, and their use seems to be part of the language's *ethos*.

There are many reasons to use interfaces. Personally, I tend to create an interface for virtually every object that I create.
This has several benefits:

- It allows me to define *what the object does* without having yet to worry about actual implementation of functionalities and related tests
- It makes writing tests **very easy**
- By defining the *signature* of an object, I'm forcing it to adhere to a **contract** of sort, as my object's public methods will all be described by a previously designed interface.
- It makes it easier to avoid more obvious violations of the *[Interface Segregation Principle](https://en.wikipedia.org/wiki/Interface_segregation_principle)*
- It gives me the flexibility to quickly *swap one object for another*, as long as the interface adopted is the same

No matter what language you're working with, make it a point to have an abstract signature of your object before you go ahead with the actual implementation.

## Conclusion

There are other good practices that can be kept in mind while doing OOP, such as aiming for object's immutability.
But I believe that by at least keeping in mind the practices listed above, you can write high quality Object Oriented Code that makes sense and that you can be proud of. 

***

### Further reading:

* [Why getter and setter methods are evil](http://www.javaworld.com/article/2073723/core-java/why-getter-and-setter-methods-are-evil.html) - Allen Holub
* [Achieving Abstraction In JavaScript](http://www.yusufaytas.com/achieving-abstraction-in-javascript/) - Yosuf Aytas
* [Objects should be immutable](http://www.yegor256.com/2014/06/09/objects-should-be-immutable.html) - Yegor Bugayenko
* [Is Go OOP?](http://spf13.com/post/is-go-object-oriented/) - Steve Francia
* [Elegant Objects](http://amzn.to/1R0NSpg) [Amazon] - Yegor Bugayenko
