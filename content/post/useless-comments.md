---
author: Marco Troisi
categories:
- Software Development
- Code Reviews
date: 2017-05-15T07:09:32Z
description: "Comments can point to inherent problems with code you're reviewing, but many are a waste. Here's how to separate the good from the bad."
draft: false
featured_image: "http://www.marcotroisi.com/images/useless_comments.png"
layout: post
tags:
- code reviews
- code
- comments
title: Useless comments can ruin your code reviews. Here's how to erase them
url: /useless-comments-can-ruin-code-review/
comments: false
---

<p>When it comes to reviewing someone else's code, how should you approach comments?</p>
<p>Comments are typically seen as a good thing. They can improve readability, offer context as to what the code is trying to do, and help you remember parts of the code that should later be changed or refactored.</p>
<p>But is that all true? Are comments really that good, or can they be the telling sign of a bigger problem?</p>
<p>The hard truth is that, in many cases, comments can point you to inherent problems with the code that you're reviewing. There are also cases when comments are helpful, and you should know how to identify when and where this is the case.</p>
<p>But first, here are some examples of bad comments.</p>
<h2>//FIXME</h2>
<p>Just look at this piece of code:</p>

```php
$done = false;
$attempt = false;

while (!$done) {
    $attempt++;
    $done = true;

    performSomeAction();

    if (somethingWentWrong()) {
        $done = false;
    }

    // FIXME Should we delay a second or two before retrying?
}
```

Who wrote that `FIXME` comment there? Was it the developer who initially built this feature&nbsp;or someone who worked on this piece of code later on?

<p>If you're reviewing this code, you probably have the answer and are probably at the best point in time to stop this from going to the master branch.</p>
<p>There is no reason for that comment to be there. If&nbsp;the question, "Should we delay a second or two before retrying?"&nbsp;is an open one, then the developer should ask the&nbsp;<a href="http://www.yegor256.com/2016/05/24/who-is-project-manager.html" target="_blank">project manager</a>&nbsp;so that an actual answer can be found. If there is no project manager to be found, then, of course, we have a bigger organizational problem. Regardless, the comment here is indicative of something that might be wrong with the project, and that should not be tolerated. This is a classic example of the comment being a symptom of a bigger, in this case organizational, problem.</p>
<h2>//TODO</h2>
<p>TODO&nbsp;comments are often introduced by the same developer who built the new feature or piece of code that's being reviewed. That's because as she was working on the code, she realized that some improvements could be made, only to decide not to apply those improvements this time around. This could be due to any number of reasons, from time limitations all the way to laziness.</p>
<p>A&nbsp;TODO&nbsp;comment could indicate that some small refactoring may be helpful:</p>

```golang
// TODO: do decompose conditional (https://refactoring.com/catalog/decomposeConditional.html) here 
// by replacing this condition with a function
if user.isActive == true && user.Country == "Ireland" {
    doWhatever()
} 
```

<p>Of course, it only takes a few minutes to replace that line of code with something like:</p>

```golang
if isActiveUserFromIreland(user) { ... }
```

There is no reason to clutter your code with a&nbsp;TODO comment&nbsp;when all it does is reminding us of a small, quick refactoring that could help us improve the code. If it's a small enough change, it should just be done. There is no need to defer that change.

<p>A&nbsp;TODO&nbsp;comment could also point to the need to add something very important, as in this case:</p>

```golang
func addUser(name string) {
    // TODO: save user to database
}
```

<p>Here, this functionality simply doesn't work. That method is meant to save something to the database, and it's obviously not doing it.</p>
<p>While in the first example the change needed was a small one and it should have simply been done, now we're faced with a potentially more complex functionality. Who knows why that's not been done yet? Maybe we haven't chosen a database library yet, or we lack some vital information to proceed. Regardless, that&nbsp;TODO&nbsp;comment is there to clutter our code. It's not the best way to achieve what we want, namely, to remind us that the functionality that saves the user to the database needs to be implemented.</p>
<p>Whether the change indicated by the&nbsp;TODO&nbsp;comment is a small or a big one, it inevitably points us to the lack of a properly used ticketing system such as&nbsp;<a href="https://www.atlassian.com/software/jira" target="_blank">Jira</a>,&nbsp;<a href="https://guides.github.com/features/issues/" target="_blank">GitHub Issues</a>, or&nbsp;<a href="https://www.jetbrains.com/youtrack/" target="_blank">YouTrack</a>.</p>
<h2>Unnecessary comments</h2>
<p>Have you ever heard someone saying that you can never have too many comments in your code? Unfortunately, that's not true. Comments that are not strictly necessary can be instrumental in hiding badly designed code.</p>
<p>Look at this example:</p>

```golang
type User struct { ... }
func (u *User) changeName(name string) {
  // verify whether the user has a name already
  hasName := false
  if (u.Name != nil) {
    hasName = true
  }
  
  // if user has a name already
  if (hasName) {
    u.PreviousNames     = append(u.PreviousNames, u.Name)
    u.NameChangesCount  = u.NameChangesCount + 1
  }
  
  // save the new name 
  u.Name = name
  u.FullName = u.Name + " " + u.LastName

  // save initials
  u.Initials = u.Name[0] + u.LastName[0]
}
```

<p>On top of some obvious problems there, what those comments tell us is that we're dealing with bad design. There are a number of concerns with this function, such as:</p>
<ul><li>Breach of&nbsp;<a href="https://en.wikipedia.org/wiki/Single_responsibility_principle" target="_blank">single responsibility principle</a>: The function is doing too much.</li><li>Too much procedural code: Those pieces of code could easily be moved into small, expressive functions.</li></ul>
<p>There is more that we could say about this piece of code, but let's focus on the comments and why they're indicative of the above-mentioned issues.</p>

First, if the function had complied with the single responsibility principle, we wouldn't have needed those comments at all. The function is called `updateName`, and as long as what's happening inside the function is the update of a name, then there is no need to add any comment. It's self-explanatory!

Second, it's clear in the example that the comments are enabling us to keep adding lines of code doing all sorts of things. A thoughtful programmer would feel *unjustified* in adding more and more lines of code to a single function. But, because there are nice little comments telling us what's happening line by line, then it feels like it's not a big a deal after all.

<p>In the above example, virtually any piece of code that's preceded by a comment should be in its own function. There is no way around that. Comments are only a shortcut in this case, and they should be treated as such.</p>
<h2>Commented pieces of code</h2>
<p>This is an easy one to identify. A piece of code that used to be running and that gets commented out should have no place in your code. As a code reviewer, it's your responsibility to point this out.</p>
<p>The reasons for leaving a piece of code commented instead of removing it completely are typically related to either not being sure if that code will ever be needed again, or wanting to leave it there as a point of reference for everyone else.</p>
<p>These are not good enough reasons to clutter your code with unused code.</p>
<p>But then, how do you preserve a piece of code that could be needed for the future? The short answer to that is: You don't. The longer answer comes in two points:</p>
<ol><li>You should be working with a modern version-control system such as&nbsp;<a href="https://git-scm.com/" target="_blank">git</a>. That will always allow you to go back to any prior version of a file&nbsp;and look at the code as it was.</li><li>There is no reason for you to believe that the exact piece of code that you're commenting will still be working once it's needed again. You should rather have a place where you can document the way that piece of code used to work on a high-level basis. It should then be implemented afresh if you ever need to in light of the way the rest of the code works&nbsp;<em>now</em>.</li></ol>
<h2>What's so bad about comments?</h2>
<p>We've looked at a number of specific examples that should help you identify bad comments when you see them as you perform a code review.</p>
<p>But comments should almost always make you stop and carefully consider whether they're needed or not. Here's why:</p>
<ul><li><strong>Clutter.</strong> Bad comments add clutter and make the code less readable. It's important to only keep the comments that are strictly necessary.</li><li><strong>Bad design.</strong> As we've seen in the examples above, comments often tell us that the design could have been way better.</li><li><strong>Laziness.</strong> Comments can be used as a cheap shortcut to avoid writing proper code according to best practices, as in the "unnecessary comments" example.</li><li><strong>No compiler checking.</strong> Comments go unchecked by the compiler, which means that there is no way to ever tell us if they're correct or not. Code itself is the most reliable and self-documenting resource.</li></ul>
<h2>Good comments</h2>
<p>With few exceptions, the only comments that can be considered good are the ones that give us a high-level description of a construct (such as a class, a type, an interface, or a function).</p>
<p>As in this example:</p>

```golang
// Car is an interface that can be used to implement Car objects
// It's a generic car and it's not specified whether the gearbox
// is automatic or manual
type Car interface {
  SwitchEngine()
  Gear() Gear
  Colour() string
}
```

This is a perfectly acceptable comment that gives us context as to what the `Car` interface is about. We probably would have understood it without the comment as well, which is the whole point. But the comment is helpful and doesn't take anything away from the correctness of the code.

## Code review de-coded

<p>As we've seen, there are some cases (however limited) where comments can be useful for the person reading them. The key is to only add information that the reader could have deduced anyway. Comments should help provide context to a construct, but they should not be used to describe what the code is doing.</p>
<p>It's important to also make sure that comments aren't masking bigger issues, such as fundamental organizational inefficiencies or laziness on the part of the developer who wrote the code. Even though comments are often viewed as positive, it's always a good idea to carefully review code with too many comments mixed in.</p>

*** 

***This article was first published on [TechBeacon](https://techbeacon.com/useless-comments-can-ruin-code-review-heres-how-erase-them).***
