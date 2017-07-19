---
author: Marco Troisi
categories:
- Software Development
- Code Reviews
date: 2017-07-18T08:07:41Z
description: "Variables shouldn't be used as a shortcut toward readability. Only good code design can give you that."
draft: false
featured_image: 'http://www.marcotroisi.com/images/unnecessary_variables.jpg'
layout: post
tags:
- code reviews
- code
- variables
- unnecessary variables
title: Why unnecessary variables are bad for your code
url: /why-unnecessary-variables-are-bad-your-code/
comments: true
---

Variables are one of the most basic elements of programming. They're usually one of the first things you learn about in programming courses, so your habits for using them form early.

It’s no surprise that every so often we see them being misused and even abused. They can be powerful if used properly, but they can also point to a lack of proper design when not used in the correct way.

It’s a particularly bad practice when variables are used to explain what is going on in the code. It’s no different than the [issue of comments](https://techbeacon.com/useless-comments-can-ruin-code-review-heres-how-erase-them). The code should be self-explanatory, and neither comments nor variables should be used as shortcuts to achieve that.

When reviewing someone else’s code, we should be looking at the variables that are being created and assigned all over and ask ourselves whether there could be a more efficient, cleaner way to perform the same operation.

## The myth of increased readability

Popular programmer wisdom seems to favour creating variables for the sake of readability. But this has two main issues:

**1. Variables actually make readability worse.**

As [explained](http://www.yegor256.com/2015/09/01/redundant-variables-are-evil.html) by Yegor Bugayenko, more variables in the code mean more lines of code and more values/names that need to be kept in mind while scrolling through the code. He argues that it is much easier to read a line of code that contains all you need to know, rather than having to constantly double-check what the content of a variable is before you can understand the purpose of the line of code you have in front of you.

**2. A variable for readability is almost invariably a shortcut.**

If the main purpose of a variable is to increase readability, then we know that a shortcut has been taken. Readability comes for the most part from good design. Using a variable with the intention of making the code more readable comes very often as an afterthought. And an afterthought is hardly ever synonymous with carefully thought-out design.

## Variable misuse scenarios

It’s important to know what variable misuse scenarios look like so that we are able to identify them while reviewing someone else’s code. It also makes sense to know some practical ways to "fix" the issue and why it’s necessary.

### A small variable
When a small variable is used for the sole purpose of increasing readability, it looks something like this:

```js
var Author = Book.AuthorName();
// ...more code here...
console.log("The author of the book is: " + Author);
```

This helps no one. We’re simply adding yet one more line to the codebase. While at a superficial level it might look as if this is helping readability, it’s offering no real, substantial help over the use of a method from the object Book, namely Book.AuthorName(). In fact, it’s making things worse. Whoever reads this code is always going to need to look for where the variable Author is being defined to identify its content.

The above example can be improved by changing it to look like this:

```js
// ...more code here...
console.log("The author of the book is: " + Book.AuthorName());
```

Of course, this is a rather basic and oversimplified example. But by understanding the principle, you should be able to recognize similar, more complex cases of abuse of a small variable.

### A long variable

There is a place where it might seem harder to argue that a variable for the sake of readability is unjustified. That’s the case of a variable containing a much longer value.

Imagine a value that looks like this:

```

html = HTML(open(url))
author_name = html.css('a')[5].text.chomp
puts "The author of the book is #{author_name}."
```

Now, it would look horrible to concatenate all of `html.css('a')[5].text.chomp` directly with the printed message, right? Right. But the solution is not to put that value into a variable. Rather, it should all be contained within a small function or object.

This is what it could look like:

```
def author_name_from_html(html)
  return html.css('a')[5].text.chomp
end
```

And then what gets printed is:

```
puts "The author of the book is #{author_name_from_html(html)}."
```

Here are the reasons why this is a much better solution:

1. **It’s cleaner**. There are no variables all over the place, just a small, handy function.
2. **It’s reusable**. You can use that function everywhere in the system. That's not the case with variables, unless you adopt global variables, which is usually not a good practice.
3. **It’s easier to understand**. You don’t need to look at the implementation details of the function to know what’s happening. By quickly glancing at its input (html) and its output (a string), you know exactly what to expect whenever you’re met with that function.
4. **It’s testable**. This should actually be the first point! You can write a test over that function and make sure that it does exactly what it’s supposed to. No such luck with a variable.

## Nothing replaces good design

At this point, it should be obvious that variables are not as innocuous as some might think. Being a rather easy tool to use, they can very often tempt the developer to use them as a shortcut to make the code look better. But as we’ve seen, they are not the best way to improve hard-to-read code. In fact, they often make matters worse.

Nothing can replace a good design. When doing a code review, take the time to carefully consider whether the variables used actually have a place there. Training yourself to recognize misused variables and to rework that code will make you a much more valuable code reviewer.

*Image credit: [Flickr](https://flic.kr/p/LEQYA)*

***What's your experience with useless or bad comments? Share your thoughts in the comments below.*** 

*** 

***This article was first published on [TechBeacon](https://techbeacon.com/why-unnecessary-variables-are-bad-your-code).***
