---
author: Marco Troisi
categories:
- Software Development
- Technology
- Tools
date: 2016-07-07T20:32:31+01:00
description: You need the best tools to do your job well. Aligning yourself to the industry is the best thing you can do.
draft: false
featured_image: "https://www.marcotroisi.com/images/right_tools.jpg"
layout: post
tags:
- tools
- git
- svn
- ide
- intellij
- jira
- github
title: The right tools for the job
url: /right-tools-for-programming/
---

<!-- MarkdownTOC -->

- [Why you need the best tools](#why-you-need-the-best-tools)
- [Writing code](#writing-code)
- [Version Control](#version-control)
- [Code sharing and collaboration](#code-sharing-and-collaboration)
- [Code review](#code-review)
- [Bug tracking](#bug-tracking)
- [Continuous integration](#continuous-integration)
- [Static analysers](#static-analysers)
- [Conclusion](#conclusion)

<!-- /MarkdownTOC -->

<a name="why-you-need-the-best-tools"></a>
## Why you need the best tools

Hardly any job can be done without the right tools. You always need *something* to do what you do. This applies to virtually everyone, from a dentist to a photographer, a journalist to a mathematician. And of course the software engineer is not excused.

Give an old, cheap, faulty camera to a great photographer, and he'll come back to you tired and frustrated, with only a few nice photos and more bad ones than what would be considered acceptable from a professional. Give a fantastic camera to a decent photographer who knows how to use it, and he'll come back with loads of good photos, a few amazing ones, and perhaps a couple of not so great ones.

That's why I'm always amazed at how many software engineers and employers tend to overlook the importance of using the right tools. It's simply astonishing. One reason for that, as I understand it, would be fragmentation, or *diversity of opinions*. A developer might like a certain tool more than another one.

But here's where I think the controversy starts: it doesn't really matter what you think is better. **What's better is what the industry decides it is**. Look at it this way: if you're a photographer and you think the best way to take photos of your clients is on a 15-years-old Polaroid, does that make it the best tool for the job? I mean, your customers are paying you real money for professional, high-quality photos that they can not only print, but also store on their hard drives. And you give them a bunch of low quality photos printed from an old instant camera. Does this sound right to you? It doesn't to me.

In the same way, it wouldn't matter how cool and geeky it makes you feel to work on a *Raspberry PI Model A*. The truth is that you're going to spend twice as much time doing what you have to do, because of the inherent slowness of such a small machine; plus you won't have state-of-the-art tools to help you write code, test, debug and so on, because most development software isn't yet supported on an ARM architecture.

As a software engineer, I need to be an absolute professional in what I do. And I need to be in line with what the industry thinks are the best tools.

These things may and will change in the future, but as things stand now, the industry seems to be saying the following things:

<a name="writing-code"></a>
## Writing code

The *best way to write code* is through a powerfully integrated IDE like the ones from JetBrains, or a faster text editor like Sublime Text or Atom, provided you have the right plugins for your language of choice installed. No, you can't use Notepad, that's just not good enough!

<a name="version-control"></a>
## Version Control 

The industry is also saying that the *best version control system* is **Git**. It's the system that the biggest number of companies and developers all around the world have found to be the most powerful one. While in terms of usage percentage it may still be fighting against SVN, a quick look at the projects that still use the latter will quickly reveal how the vast majority of them are only using it because of legacy. In other words, those are very old projects, and they were using SVN since before Git was even a thing. But then, why would they keep using such an ancient and inefficient system when there are plenty of ways to migrate to Git? This is something I don't fully understand.

<a name="code-sharing-and-collaboration"></a>
## Code sharing and collaboration

Another thing the industry has been saying for a while now, is that the *best way to share code* is to use **GitHub** on top of the already-mentioned Git. Now, I understand that some companies may find that BitBucket or GitLab fit their needs better. But given the choice, and all things being equal, GitHub is *the* one. It's the most widely supported and most well known collaboration platform out there.

<a name="code-review"></a>
## Code review

Tools for [Code reviewing](http://marcotroisi.com/the-ethics-of-code-reviews/) are also important, and they are strictly related to collaboration tools in that the *best way to review* your peers' code appears to be yet again **GitHub**. Their code reviewing tool is just too good, and it's simply too easy to use when you're already on GitHub, so there's just no need to be looking for anything else.

<a name="bug-tracking"></a>
## Bug tracking

For a project to work well, you're going to need some kind of bug tracking system. I've personally had to work with several of them, from [Redmine](http://www.redmine.org/) to [Trello](https://trello.com/), from [Jira](https://www.atlassian.com/software/jira) to [YouTrack](https://www.jetbrains.com/youtrack/), and of course GitHub Issues. Here I'd have to say that I've had decent experiences with pretty much all of them: once you get used to one of them, they can all do their job, no question about it. But there seems to be a general consensus on **Jira** being the best tool out there, and I think that's right. While every other platform I've used was good enough, every time that I come back to Jira after a while, I am just amazed at how powerful and functional it is. And, every time I use a different tool after having worked with Jira for a while, it always takes me a while to adapt and a good dose of resignation at knowing that I'll be missing some Jira's unique features.

<a name="continuous-integration"></a>
## Continuous integration

Continuous integration is another critical topic. Here, what the industry appears to be saying is that [you need to do it](https://www.thoughtworks.com/continuous-integration). There is no point in looking at tools here if one doesn't even believe in the usefulness of doing Continuous integration. It will make it incredibly easier for you to keep track of what is going on, and to find bugs before they get deployed on production. As far as tools go, no longer that a few years ago the only viable option was to set up Jenkins on some server of yours, and spend days trying to make it work, not to mention the fact that someone will have to keep an eye on it because something might always break. This problem has now been largely solved by the emergence of many excellent, cloud-based CI platform. Prices are pretty fair, usually free for open source and in some cases free for small private projects as well. The most complete, well documented and most supported of them is undoubtedly Berlin-based [Travis](https://travis-ci.com/). Recently, [CircleCI](https://circleci.com/) has also attracted a lot of attention, mostly because it's very fast, and because it's free for small projects (i.e. if you only run one build at a time). I haven't found their documentation to be outstanding, and there's not (yet) much help to be found online, but with a bit of effort I've always been able to make it work nicely.

<a name="static-analysers"></a>
## Static analysers

Something else that you should make sure to have in your stack at some point: static analysers. These tools, while obviously far from replacing the need for writing clean code on the side of the programmer, are very helpful in pointing out a lot of code smells, therefore helping immensely especially during (or before) the process of code reviewing. Here things may change based on the language you're using. [CodeClimate](https://codeclimate.com/) supports a lot of languages, and it's probably the one you want to go for in many cases. Being open source, you can either download it and use it from your command line, or pay for the cloud version, which offers a nice UI and it's perhaps a better deal overall. I'm also a big fan of [Scrutinizer](https://scrutinizer-ci.com/), but it supports only a limited number of languages. The best way to make static analysers part of your development process, is to add it to your GitHub build. This allows you to check in real time, as you create a Pull Request, the quality of code you're trying to push to the master branch. Moreover, you can make this even stricter by using GitHub's [Protected Branches](https://help.github.com/articles/about-protected-branches/) feature, and disallowing you and your collaborators from merging into the master branch unless a certain level of quality has been reached.

***

<a name="conclusion"></a>
## Conclusion

While it's totally understandable that from time to time it might not be possible for someone to follow the above guidelines in their entirety, it's probably worth it to **ask yourself** if there are good reasons for not following them. If there aren't, then it's definitely time to consider implementing some change.

As a software engineer, there's no reason to be left behind by the industry and, most importantly, not to use the right tools to deliver the best possible work. As a company, there's no reason why you wouldn't make it possible for your people to work with the best available tools, making both them and your customers happier.





