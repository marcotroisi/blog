---
author: Marco Troisi
categories:
- Architecture
- Technology
- Serverless
date: 2017-01-31T16:53:45Z
description: Brief description of the article
draft: true
featured_image: '** remove this if not present **'
layout: post
tags:
- serverless
- aws
- lambda
- microservices
- functions
- faas
title: An Intro to Serverless
url: /an-intro-to-serverless/
---

"Serverless" is a term you may have heard of recently. It's also known as *Function as a Service* (FaaS), and it basically involves storing your functions somewhere in the cloud, and then invoking and running them via a trigger. But how does a Serverless system actually work? And is it something we should be looking at?

## How it's presented

The concept of Serverless has been made popular by [AWS](https://aws.amazon.com) with its relatively new product [Lambda](https://aws.amazon.com/lambda/). It's pitched as a way to *"Run code without thinking about servers."* Another important element of it, which AWS works hard to make us notice, is the notion of paying only for *"the compute time you consume"*.

Interestingly, Google Cloud has a similar (if not identical) product called Cloud Functions, which is presented from a different angle: *"A serverless platform for building event-based microservices"*. A more architectural perspective, if you will.

## What it essentially is

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">If your PaaS can efficiently start instances in 20ms that run for half a second, then call it serverless. <a href="https://t.co/S3YzvqFYLR">https://t.co/S3YzvqFYLR</a></p>&mdash; adrian cockcroft (@adrianco) <a href="https://twitter.com/adrianco/status/736553530689998848">May 28, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

When it comes down to it, you could look at Serverless as Heroku on steroids.

Clearly, the servers are still there. It's just that those companies (AWS, GCE, etc) have gotten to the point where they can get their servers up and down in a matter of milliseconds. Hence, they tell you, if you have a functionality which is only running several times a day on an on-demand basis, do you need a server dedicated to it and running all day long?

Looking at it from a microservices perspective, that's what we would have done. We would have split that critical functionality into a separate microservice, running on its own server. Then, we would have made sure we could expand that server's capabilities in as painless a way as possible. 

Serverless promises to take care of some of that for us. Firstly, it's supposed to save us some money by only making us pay for the computing resources we need. Then, it takes care of scaling the servers up and down based on the need of the moment. 

On a good ol' PaaS platform such as Heroku we would have had the same peace of mind of not having to think too much about servers setup and provisioning. But costs could have gotten prohibitively expensive once we reached a certain amount of computing operations. And, of course, we would have had to take care of scaling up or down ourselves.

## Do we need it?

I believe that looking at Serverless as a "PaaS on steroids", while undoubtedly an over simplification, can be helpful. Not only it helps us understand Serverless better, it also gives us some direction as to when and whether we need to consider Serverless for our software.

In most cases, if you had good reasons for not using a PaaS platform, then those same reasons probably still apply for Serverless. 

If you're a happy PaaS user, then Serverless may be an option to consider, but it won't always work. Similarly, if you're doing microservices, Serveless is again something you can keep an open mind about.

So, while Serverless and traditional PaaS are not exactly the same thing, they can be seen as solving similar problems though they have different use cases.

## When to use it

The most typical and realistic scenario for Serverless is the following. You have a system built with a microservices architecture. 

## When NOT to use it
