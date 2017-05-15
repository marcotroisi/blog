---
author: Marco Troisi
categories:
- Software Development
- Code Reviews
- Teamwork
date: 2017-04-20T08:01:27+01:00
description: "What's the best time to do code reviews? When considering your development or DevOps workflow."
draft: false
featured_image: "http://www.marcotroisi.com/images/code-review-workflow.jpg"
layout: post
tags:
- code reviews
- github
- crucible
- development workflow
title: How to run code reviews in your dev team's workflow
url: /how-run-code-reviews-in-your-workflow/
comments: true
---

While they're usually accepted as a good practice, code reviews remain a topic of debate among software engineers. Many programmers still struggle to identify the extent of code reviews' value and their place within a team's workflow.

The questions of [why you should do them](http://marcotroisi.com/the-ethics-of-code-reviews/) and when have more in common with each other than you might think. To maximize the effect of a code review, doing it at the right time within your development workflow is crucial.

At the same time, trying to artificially fit code reviews within your existing workflow is not always a good idea. If you want to make sure you get the best out of every code review, adding one as just another step to your workflow may not be enough. Some changes to your workflow could be necessary. I'm going to help you answer the simple question:

## Before the code gets merged

The most obvious advice when it comes to code reviews is to do them [before the new code gets merged](http://softwareengineering.stackexchange.com/a/121665) into your production or main development branch.

The main reason for this common piece of advice is that you want to be able to find any potential issue before the code makes it to the place where everyone else will be using it.

This does, of course, seem to work better with a distributed version-control system, such as Git or Mercurial, that lets developers work on their own local version of the repository. When the work is completed, they will then request (via a [pull request](https://help.github.com/articles/about-pull-requests/), for example) that someone review the new code. You can set rules so that the code will get merged only once it's approved by the reviewer.

Note that there is nothing wrong with performing a second code review after the code has been merged, but it would be a mistake for the code not to be reviewed before it gets to that point. Also, post-merge is probably a better time to perform an [independent review](http://www.yegor256.com/2014/12/18/independent-technical-reviews.html).

## After the tests have been run

Code reviews are no replacement for a reasonably high test coverage. While it's obvious that a code review itself should help find bugs in the code, your fellow code reviewers shouldn't be finding regressions—those should be caught by automated tests.

Before a code review, the new code should have sufficient test coverage, and all tests should be passing. If anything breaks, it has to be fixed before someone is asked to review the code.

The reason for this is that you want to give each step of your development workflow its own responsibility. While code reviews can, at times, be instrumental in finding bugs, they are not the primary instrument for that purpose. This work needs to be done by a robust collection of [unit](https://en.wikipedia.org/wiki/Unit_testing), [functional](https://en.wikipedia.org/wiki/Functional_testing) and [integration tests](https://en.wikipedia.org/wiki/Integration_testing).

There's always the possibility of a bug not being caught by any test, and that's where code reviews typically become critical. Another possibility is that the tests are badly written and so, while they pass, they don't really make sure that the code's business logic is doing what it's meant to do. Again, this is where a good code reviewer will step in.

As far as the process goes, the priority is to make sure that all tests are automated and run explicitly when new code gets pushed. The code reviewer should be able to fully trust that the committer of this new piece of code has run the tests and that the code compiles.

The results of the automated tests should also be clearly visible to everyone. Your automated tests should be integrated as a required step before merging, with the results of those tests publicly available. This is very easily done on [GitHub](https://help.github.com/articles/enabling-required-status-checks/) and similar platforms.

## The case for small branches

I already mentioned how a bad development workflow might negatively impact the effectiveness of code reviews. A bad practice that many teams seem to fall victim to is creating big tickets/tasks (and therefore branches) that someone will be working on for several days, weeks, or even months.

You want to do the opposite. Keep your tasks (and branches) as small as possible. This will make writing each task's code much easier for developers, and it will also be a more manageable review for the code reviewer.

Reviewing a day's worth of code is a task that can be done in a few minutes, and the review will likely be much more accurate than if the reviewer had to check several weeks' worth of work. The chances of missing something crucial when reviewing big chunks of work, rather than small ones, go up exponentially.

## Short reviews, often

Reviewing other people's code shouldn't take hours out of an engineer's day. By keeping tasks small, you allow the senior engineers or software architect to do code reviews often and for short sessions.

[Gareth Wilson](https://twitter.com/_gw?lang=en), in his article on [effective code reviews](https://blog.fogcreek.com/effective-code-reviews-9-tips-from-a-converted-skeptic/), outlines how running code reviews often and for short sessions has a couple of benefits.

First, it doesn't interrupt your flow. Engineers know how important this is; there is nothing worse than getting interrupted or having to do context switching while you're "in the zone." As [Cal Newport](http://calnewport.com/blog/), a computer science professor explains in his book [Deep Work](https://www.amazon.com/Deep-Work-Focused-Success-Distracted-ebook/dp/B013UWFM52/ref=sr_1_1?ie=UTF8&qid=1488218902&sr=8-1&keywords=deep+work), in order to produce a high-quality piece of work, we need prolonged, interruption-free times of deep thinking and undivided focus. Short code reviews take just a few minutes, allowing engineers to have a short block of time to focus on them and larger blocks of time to focus on writing code.

Second, it's less frustrating for the person who wrote the code, since he won't need to wait several days for someone to finish reviewing his work. Instead, he can get quick feedback and apply the requested changes while everything is still fresh in his mind.

## Are "pair reviews" a good idea?

Very often in development teams, the code's committer will sit together with the reviewer and look at the new piece of code. The reviewer will scroll through the new code, while the committer will try to explain what's going on.

This may sound like a good idea, and it definitely has its place in various instances, but it's not the most effective way to run a code review, because it misses an important reason for doing the review in the first place: Namely, the review should verify that the code is easy to understand and self-explanatory.

The only way to make sure this is the case is for the reviewer to look at the code alone and try to get an understanding of it without asking the code writer any questions. If the reviewer is unable to understand the code, that is typically a sign of badly written code or a lack of good unit tests.

## Should the architect or senior engineers do the review?

Ideally, both another engineer and the software architect should perform code reviews.

A code review performed by a peer engineer has a different purpose than one performed by the architect. While both of them will be looking for a lot of the same things, such as bugs, lack of tests, readability, and so on, the architect will also use the code review to make sure the team is following architectural guidelines.

As [Yegor Bugayenko](http://www.yegor256.com/) [explains](http://www.yegor256.com/2015/05/13/two-instruments-of-software-architect.html#reviews), code reviews enable the software architect to enforce the design and architectural principles of the project.

Another engineer can always identify a deviation from the guidelines and best practices followed by the team, but it's the software architect, says Bugayenko, who needs to use code reviews to prevent his vision from being destroyed.

In other words, code reviews are a crucial tool for a software architect to make sure that the team is following the architectural direction that's been established.

## Tools matter

A better tool will allow you to perform better code reviews. Period. It's as simple as that. Downloading the new code, screening it file by file, and then writing your comments somewhere else is not only an inefficient use of time, but also a great way to ensure that your code review will not be very effective.

Modern code review tools such as [GitHub](http://marcotroisi.com/right-tools-for-programming/#code-review), [UpSource](https://www.jetbrains.com/upsource/), and [Crucible](https://www.atlassian.com/software/crucible) allow you to perform code reviews quickly, hold conversations about a piece of code, and, most importantly, easily verify that the suggested changes have been made.

Companies should invest in code review tools because they are a relatively cheap and simple way to make sure that the new code doesn't cause any damage once it gets introduced. Making sure that your team has the best code review tools is a great way to protect the quality of your software and safeguard your customers from potential new bugs.

## A simple but powerful tool

Code reviews are one of the simplest tools we have to ensure the highest quality of our software. But their effectiveness will greatly increase or diminish based on how well code reviews fit within the development workflow and on whether we're willing to invest in them.

Changing or adapting some aspects of your workflow based on the advice I've given will help your team perform more effective code reviews. 

***How does your team run code reviews? Share your best (or worst!) practices in the comments below.***

*** 

***This article was first published on [TechBeacon](https://techbeacon.com/how-run-code-reviews-your-dev-teams-workflow).***
