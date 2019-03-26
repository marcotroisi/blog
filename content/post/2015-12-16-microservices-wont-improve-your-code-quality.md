---
title: Microservices won’t improve your code quality
description: "I am very excited about microservices, but they are not going to make my code quality better. That will always be up to the programmer."
author: Marco Troisi
layout: post
date: 2015-12-16
url: /microservices-wont-improve-your-code-quality/
categories:
  - Opinions
  - Software Development
  - Technology
tags:
  - architecture
  - code quality
  - microservices
featured_image: "https://www.marcotroisi.com/wp-content/uploads/2015/12/microservices-wont-improve-code-quality-small.jpg"

---
If you've read some of my [previous posts][1], you'll know that I'm fairly excited about microservices. No, I do not believe them to be the answer to all of software development problems, but yes, they can be _one of_ the answers to _some of_ the problems we face.

I say that and I mean it. Who doesn't want to be able to rewrite a critical part of an application in two weeks or less? Who doesn't think it's the best thing for a service to handle graciously a failure on the part of one of its components, rather than becoming entirely unavailable?

Yes, microservices are a great thing.

But we are professionals, and as such we can't afford going after what's &#8220;cool&#8221; in the industry without keeping track of the big picture.

## Write great code first

Just as knowing how to count doesn't make you a Mathematician, knowing how to write some code doesn't make you a Programmer. I hope I don't sound elitist or arrogant when I say that, but I am convinced that if we don't take ourselves seriously, no one else will.

Being a programmer means knowing the discipline of programming. It means being aware that every line of code you write today, will have a consequence in the lives of both the end user of your application, and other programmers that will successively work on that same piece of code.

This is obviously not the right place to list all the things that you should be aware of while writing your code, but suffices to say that there are quite a few of them, and being careless about them is a clear indicator of how (un)seriously is one taking her job.

## What you need to know before you start with microservices

Before you even begin to think about doing microservices, you need to get some facts straight:

  1. The monolith is not bad per se
  2. Microservices don't magically suspend the rules

Let's have a closer look at them:

### The monolith is not bad per se

We are being sold this idea that monolithic software is messy, slow and evil. The code? Spaghetti without a doubt. But this is of course only true if you let it. Ideally, in a monolithic application that's been developed following the basic principles of a clean architecture, and possibly using TDD, I see no reason why those bad things should be true.

### Microservices don't magically suspend the rules.

Say you know how to do your job well, and you've written perfectly clean monolithic application until now. You are told that microservices make the whole thing so much easier, and each component is so small that you don't need to put the same amount of care into it. Is that true? No, it isn't.

That would be like _Pirelli_ thinking they don't have to work as hard on their tyres as would a theoretical guy who is in charge of building the entire car by himself. After all a tyre is just a small part of a car, isn't it? I mean, if anything breaks or if you need a different type of tyre, you quickly replace it.

In the same way, one should feel justified to build the _Withdrawing_ component of a microservices-based Banking software in the most careless way! After all, if it stops working, if it becomes too slow, or if we simply don't like it anymore, we can quickly rewrite it and replace it.

I hope you can see that this is just nuts. No one thinks like that, in any industry, and neither should we. Pirelli would have their best engineers designing the safest, most performant tyres possible. They wouldn't want a mistake on their part to compromise a car's reliability. In the same way, each component of our microservices-based application needs to be something we can be proud of, that can potentially run for as long as possible unless a rewrite becomes necessary for reasons beyond our control.

These days I'm hearing some people saying things like &#8220;we keep our microservices so small, that we don't even need to write tests!&#8221; I'm confused. How does that even follow? Again, imagine the guy in charge of building brakes for cars, saying &#8220;this is such a small part of the whole car, we don't even need to test it!&#8221; This makes no sense, and it's simply unjustifiable.

## (Re)defining microservices

_Microservices are really more about the deployment strategy than anything else_. As [suggested][2] by _Uncle_ Bob Martin, if you build your application following what we know to be a clean architecture, the decision of whether to deploy everything into microservices or not is one that can be easily delayed to a later point. You don't need to start building your software with microservices in mind. What you do need to keep in mind, is that your software will need to be clean and tested, at the very least.

When you look at microservices this way, they become a lot less scary, and in a sense a lot of the hype around them goes away. Obviously, a microservice architecture remains a fantastic approach that I would highly suggest for a lot of use cases. But it's not, in any way, a different approach to programming. It's the same, clean, high quality code that you have (hopefully) been writing until now, now deployed and perhaps organised differently.

Now, I am not saying that having a microservice architecture will not affect any of your design decisions. It will. But I am suggesting we don't give it more credit than we should. I am saying that we should design the architecture of our application regardless of whether it will eventually be deployed into small microservices or not. And, by all means, let's not allow the _small-ness_ of each microservice to suspend the rules of programming. No architectural choice is worth you giving up on being a professional.

Microservices won't improve your code quality. They won't make it worse either. Really, it's up to you, as it always was, and always will be.

 [1]: https://www.marcotroisi.com/tag/microservices/
 [2]: http://blog.cleancoder.com/uncle-bob/2014/10/01/CleanMicroserviceArchitecture.html
