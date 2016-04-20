---
title: Composition over Inheritance (what it is, why use it)
description: "Composition can be a more flexible way to reuse code in multiple classes, as opposed to Inheritance. An introduction to Composition over Inheritance."
author: Marco Troisi
layout: post
date: 2015-04-21
url: /composition-over-inheritance/
categories:
  - Golang
  - Javascript
  - PHP
  - Software Development
tags:
  - composition
  - embedding
  - inheritance
  - modules
  - traits

---
In today&#8217;s article, I would like to talk about something which I see that, sometimes, developers aren&#8217;t too familiar with. Most of us know what the traditional concept of **inheritance** is: a child class extends a parent class. And, obviously, multiple children classes can extend the same parent class.

What some developers don&#8217;t seem to be always aware of (or, perhaps, they just aren&#8217;t entirely sure how to use it), is the idea of **composition**.<!--more-->

## What is Composition

Composition can be explained by a child class &#8220;incorporating&#8221; one or more classes that it intends to extend. In other words, you are declaring inside your class, what other class&#8217; methods do you want to be able to use, without having to strongly tie up your children class to its parent(s).

### _Has-a_ VS _Is-a_

A good way to look at Composition is to think of a class that _HAS-A_ relationship with another class, rather _IS-A_ &#8220;son&#8221; of that class. In this sense, when you use Composition, the class has an &#8220;identity&#8221; of its own, and it&#8217;s not to be seen as being &#8220;only&#8221; a son of that other class which it extends.

## The Benefits of Composition

While I am not advocating for the complete elimination of traditional inheritance, there are benefits of using Composition that I would like to highlight. And, the way I see it, it is possible that once we realise the power of Composition over Inheritance, we may actually end up using Inheritance less and less. Here are the reasons why Composition is a good pattern:

  1. **Flexibility**: it is not by chance that I am giving this one the first position in my list. With Inheritance, as mentioned, you tie your Class up to another one, and you define even before starting to design your class, who is going to extend (be a child of) what. But, what happens if you wanted to only use _some_ of the methods that your parent has? Or, on the opposite side, what if you had 5 children of which only 2 needed a couple of additional methods? These things would not have been a problem with Composition. But the truth is that **Inheritance is often not flexible enough**.
  2. **Extension of Multiple Classes**: who says you should only extend one Class? Why couldn&#8217;t `Corolla` be a son of `Car` but also of `Toyota` at the same time? That obviously makes sense, but it&#8217;s normally not possible in traditional programming languages. [Interfaces][1] can give us some help here, but they _don&#8217;t_ actually implement the methods we need.
  3. **Avoid duplicates**: Like in the previous example, if we were to use Interfaces for our `Corolla` Class, we would end up having to write some of our methods for our `Yaris` or `Sedan` Classes. That&#8217;s not cool. Duplicating code is not a good idea.

There are other benefits to using Composition, but those are the ones I feel are the most worthy of being highlighted here.

## How do I use Composition in _[insert programming language here]_

Composition is available out of the box in [many of the mainstream languages][2]. It can be implemented in the form of a _Trait_ in PHP, Python, Scala and others; It&#8217;s called a _Module_ in Ruby, and a _Role_ in Perl. Javascript, as per usual, has [unique ways to implement Composition][3], but it&#8217;s there. Finally, it&#8217;s interesting to note that Go doesn&#8217;t even consider Inheritance as an option; Composition is the only game in town, and it&#8217;s called [Embedding][4].

**_Question: what are your thoughts on Composition over Inheritance? Where is it best to use one over the other? Share your ideas on [Facebook][5] or [Twitter][6]._**

* * *

### More to read on Composition over Inheritance

  * [Clean Code Developer][7]
  * [Wikipedia][8]
  * [Coding Delight][9]

 [1]: http://en.wikipedia.org/wiki/Interface_(computing)#Software_interfaces_in_object-oriented_languages
 [2]: http://en.wikipedia.org/wiki/Trait_(computer_programming)#Supported_languages
 [3]: http://rjzaworski.com/2013/03/composition-in-javascript
 [4]: http://golang.org/doc/effective_go.html#embedding
 [5]: http://www.facebook.com/sharer/sharer.php?u=http://www.marcotroisi.com/composition-over-inheritance/
 [6]: https://twitter.com/intent/tweet?original_referer=http://www.marcotroisi.com/composition-over-inheritance/&source=tweetbutton&text=%3F&url=goo.gl/AU3t8k&via=marcotroisi
 [7]: http://www.clean-code-developer.com/Favor-Composition-over-Inheritance.ashx
 [8]: http://en.wikipedia.org/wiki/Composition_over_inheritance
 [9]: http://codingdelight.com/2014/01/16/favor-composition-over-inheritance-part-1/
