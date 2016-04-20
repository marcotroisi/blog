---
title: 'Microservices: A Quick Introduction'
description: 'An overview of what Microservices are and why they can be a good choice for your next application.'
author: Marco Troisi
layout: post
date: 2015-03-18
url: /micro-services-a-quick-introduction/
dsq_thread_id:
  - 3605512010
categories:
  - Software Development
  - Technology
tags:
  - microservices

---
As I am in the middle of reading the excellent [Building Microservices][1] from Sam Newman, I thought I would spend some time de-mistyfying what **Microservices** are, when/if are they needed and why.

I am really grateful to this book, which I warmly recommend, for finally making the concept of Microservices so easy for me to understand, while never standing back from actually going into the difficulties of the practical world, with several real-life advices on how to make Microservices work in a modern architecture.<!--more-->

## What is a Microservice

While you can find all sorts of amazingly technical explanations out there, Newman defines a Microservice in a strikingly simple way, which I am paraphrasing here:

> A **Microservice** is a stand-alone service that can be (re)built in no more than two weeks.

For as silly and simplistic as this may sound, I think that it really gets to the heart of it. From here, you can totally go ahead talking about the best ways to implement this, but this is an exceptionally easy to remember _rule of thumb_ for all of us.

So, what are the characteristics of a Microservice? I have outlined **5 points**:

  1. **It is a Stand-alone service/application**. In other words, it is _not_ a good Microservice if it breaks when you change other parts of the application to which the Microservice itself depends on.
  2. **It is quick to (re)write**. As in the above definition, a two-weeks timeframe is a good general rule. If you can&#8217;t possibly rewrite it from scratch in two weeks or less (yes, two weeks and a half are still fine!), then you may have designed this whole thing the wrong way.
  3. **It focuses on one task**. Here the contrast with big, monolithic applications becomes more evident. If _WordPress_ were to be built on a Microservice architecture, you would have one independent, small application taking care of creating, editing and deleting _Posts_, another one taking care of _Media Content_, perhaps another one for generating _Static Pages_ and so on. You get the point. Compare this to the actual nature of _WordPress_: a single, big platform which (potentially) does everything your mind can think of, and where, of course, any plugin could easily break the entire system (see Point #1).
  4. **It is Language-agnostic**. Every Microservice will expose an API that is not dependent on the language, tools and technology used. And this is a big point in my opinion. What this means is that, for example, when building, say, a Blogging Platform, you would be entirely free to build each component with **PHP** or **Python**, privilege ease of development, except for your _Posts_ component, the most critical one, which you might just want to build with **Java**, **Go** or even **C**, to make sure that performance is never an issue. And of course the same would apply for a _Database_ engine. **Mongo** could be the perfect choice for _Posts_, but **Oracle** might be a better fit for your little _Store_ section where you sell your services.
  5. **It knows that failures exist**. In a monolithic application, if anything fails, the whole thing is likely going to fail as well. With Microservices, you know that each one of them can possibly fail or just be unreachable at any time, and so you handle it in a gracious way, with no need to panic. In our theoretical Blogging Platform, if your _Media_ Microservice becomes unreachable because, say, the Database engine of choice has stopped working, there is zero-need for the whole application to crash. You can still minimise the impact and work on bringing _Media_ back to life without impacting everything else.

## Why Using Microservices

Do you still need me to convince you? No, seriously, if you have been around in the Software Development world for a while, you have probably already realised, by reading the above listed points, what is the potential of using Microservices for your next application. Nevertheless, it is good to talk about it.

This is why I think a Microservices Architecture brings more benefits than a monolithic one.

  1. **Best Performance/Ease of Development ratio**. This is an indirect one, but if you have read my points before, you already know why is this so. You can fine-tune each little part of your big application without penalising your whole Development process. You can be strategic. There is no need to build the whole application with Java and Postgres, when some less critical parts of it could easily be built with a quick and nice Python + Mongo.
  2. **Small and focussed teams**. Instead of having a big group of developers all working on the same big project, you can have many small teams each one taking care of one or two Microservices. You can use different skills and capabilities in a more effective way.
  3. **Scalability**. Oh my goodness, scalability. If you can rewrite each component in two weeks or less, scalability is no longer that big of an issue! No need for _premature optimisation_. Is your blog finally getting the traffic you think it deserves? No problem, just **rewrite** your _Posts_ Microservice in a faster language and/or increase the hardware capabilities **only for that specific part**, and you are done.
  4. **Better Failure Management**. As outlined before, should a single Microservice fail for whatever reason, you can handle this graciously, and at the very least, you know that the rest of your application is not going to be affected.

## Conclusion

It is not my goal here to give you the most complete explanation of what Microservices are (for that, I would suggest you read the [above said book][1]). Rather, I am only outlining what I think are some of the most important characteristics of a Microservice architecture, and why it might be a good idea for you to build your next application in that way.

Are Microservices right for every situation? Of course not. But they appear to solve some problems that have been around for so long, that most of us consider to be pretty much unavoidable these days.

Are you using Microservices or planning to use them? I would love to hear your opinion on the subject.

## Other resources

  * [Microservices: Patterns and Applications: Designing fine-grained services by applying patterns][2]<img src="http://ir-na.amazon-adsystem.com/e/ir?t=marctroi-20&#038;l=as2&#038;o=1&#038;a=B00VJ3NP4A" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
  * [Martin Fowler on Microservices][3]

 [1]: http://amzn.to/1GIiYTb
 [2]: http://www.amazon.com/gp/product/B00VJ3NP4A/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B00VJ3NP4A&linkCode=as2&tag=marctroi-20&linkId=5EGJ6QO6G66E6UHZ
 [3]: http://martinfowler.com/articles/microservices.html
