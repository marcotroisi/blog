---
author: Marco Troisi
categories:
- Architecture
- Technology
- Serverless
date: 2017-02-02T16:53:45Z
description: What Serverless really means, and when should you use it.
draft: false
featured_image: "http://www.marcotroisi.com/images/2017.png"
layout: post
tags:
- serverless
- aws
- lambda
- microservices
- functions
- faas
title: "Serverless: What it is and when to use it"
url: /serverless-what-it-is/
disqusShortname: "serverless"
---

<!-- MarkdownTOC -->

- [How it's presented](#how-its-presented)
- [What it essentially is](#what-it-essentially-is)
- [Do we need it?](#do-we-need-it)
- [When to use it](#when-to-use-it)
- [When NOT to use it](#when-not-to-use-it)
- [Conclusion](#conclusion)

<!-- /MarkdownTOC -->

"Serverless" is a term you may have heard of recently. It's also known as *Function as a Service* (FaaS), and it basically involves storing your functions somewhere in the cloud, and then invoking and running them via a trigger. But how does a Serverless system actually work? And is it something we should be looking at?

<a name="how-its-presented"></a>
## How it's presented

The concept of Serverless has been made popular by [AWS](https://aws.amazon.com) with its relatively new product [Lambda](https://aws.amazon.com/lambda/). It's pitched as a way to *"Run code without thinking about servers."* Another important element of it, which AWS works hard to make us notice, is the notion of paying only for *"the compute time you consume"*.

Interestingly, Google Cloud has a similar (if not identical) product called Cloud Functions, which is presented from a different angle: *"A serverless platform for building event-based microservices"*. A more architectural perspective, if you will.

<a name="what-it-essentially-is"></a>
## What it essentially is

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">If your PaaS can efficiently start instances in 20ms that run for half a second, then call it serverless. <a href="https://t.co/S3YzvqFYLR">https://t.co/S3YzvqFYLR</a></p>&mdash; adrian cockcroft (@adrianco) <a href="https://twitter.com/adrianco/status/736553530689998848">May 28, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

When it comes down to it, you could look at Serverless as Heroku on steroids.

Clearly, the servers are still there. It's just that those companies (AWS, GCE, etc) have gotten to the point where they can get their servers up and down in a matter of milliseconds. Hence, they tell you, if you have a functionality which is only running several times a day on an on-demand basis, do you need a server dedicated to it and running all day long?

Looking at it from a microservices perspective, that's what we would have done. We would have split that critical functionality into a separate microservice, running on its own server. Then, we would have made sure we could expand that server's capabilities in as painless a way as possible. 

Serverless promises to take care of some of that for us. Firstly, it's supposed to save us some money by only making us pay for the computing resources we need. Then, it takes care of scaling the servers up and down based on the need of the moment. 

On a good old PaaS platform such as Heroku, we would have had the same peace of mind of not having to think too much about servers setup and provisioning. But costs could have gotten prohibitively expensive once we reached a certain amount of computing operations. And, of course, we would have had to take care of scaling up or down ourselves.

<a name="do-we-need-it"></a>
## Do we need it?

I believe that looking at Serverless as a "PaaS on steroids", while undoubtedly an over-simplification, can be helpful. Not only it helps us understand Serverless better, it also gives us some direction as to when and whether we need to consider Serverless for our software.

In most cases, if you had good reasons for not using a PaaS platform, then those same reasons probably still apply for Serverless. 

If you're a happy PaaS user, then Serverless may be an option to consider, but it won't always work. Similarly, if you're doing microservices, Serveless is again something you can keep an open mind about.

So, while Serverless and traditional PaaS are not exactly the same thing, they can be seen as solving similar problems though they have different use cases.

<a name="when-to-use-it"></a>
## When to use it

The most typical and realistic scenario for Serverless is the following:

You have a system built with a microservices architecture. You identify a specific operation within your system which takes considerable computing effort, with periodical and unpredictable spikes in traffic. Moreover, this operation is only activated when triggered by something else. In other words, it's not always on. That's a perfect place to try to port that particular operation into a Serverless function.

I mentioned having a microservices architecture. That doesn't necessarily have to be the case, but it seems quite obvious to me that if you're doing microservices then your system is probably more prone to further decoupling and separation of a component from the rest of the system. 

If your system is a monolith, then you probably have your good reasons why you want to keep everything within the same codebase. Nevertheless, Serverless might still make sense to you. You could, again, identify the single most critical operation within your monolith and turn it into a Serverless function; from there, even a gradual migration to a microservices architecture might just feel more natural.

<a name="when-not-to-use-it"></a>
## When NOT to use it

If you're not already on the cloud, then Serverless is really not a good idea. Services like Lambda work well when tightly integrated with the AWS' platform. For example, you trigger an event when storing a file on S3, then you run your Serverless function which does something to that file, then you store the changed file on S3 and perhaps add/update a record on DynamoDB/RDS to indicate that the operation was successful.

If you want to use Lambda but you're not already on AWS, then Serverless is just not for you. The same applies with GCE's Cloud Functions and Azure's [Functions](https://azure.microsoft.com/en-us/services/functions/).

In other words, **Serverless is one of the best ways to lock your system to a specific vendor**. If that doesn't sound like a great idea to you, then stay away from Serverless.

<a name="conclusion"></a>
## Conclusion

To conclude, Serverless/FaaS is an advancement in the way we operate our servers, and we should all be excited about it. It can be a sensible choice if you have no issue locking yourself to a particular vendor, and if your operation is at the same time:

- small
- critical
- intense computing-wise
- not always on

In any situation where all of the above conditions don't check out, a more "traditional" approach is recommended.

***

### More resources:

- [Serverless](https://martinfowler.com/articles/serverless.html#what-isnt-serverless) (Martin Fowler's blog)
- [Building Serverless Architectures](http://amzn.to/2kv7nBg) (Book)
- [AWS Lambda: A Guide to Serverless Microservices](http://amzn.to/2kte9rH) (Book)
- [AWS Lambda in Action: Event-driven serverless applications](http://amzn.to/2kv4KQf) (Book)
- [Serverless framework](https://serverless.com/)

