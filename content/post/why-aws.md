---
author: Marco Troisi
categories:
- Cloud
date: 2019-07-28T08:07:41Z
description: "Why I recommend AWS as the default cloud provider."
draft: false
featured_image: 'https://www.marcotroisi.com/images/why_aws.jpg'
layout: post
tags:
- cloud
- Amazon Web Services
title: Why AWS
url: /why-aws/
comments: true
---

One of the most common questions I receive when [talking](https://marcotroisi.com/talks/) about building an entirely serverless platform [on the AWS cloud](https://speakerdeck.com/marcotroisi/ive-seen-serverless?slide=27) is “but why AWS?”.

This is a question that usually comes with some assumptions. For example, some people believe that other cloud providers are better, and so they wonder what made us choose AWS over those. By and large, though, the main assumption seems to be that so called ‘vendor lock-in’ is a bad thing.

My answer typically comes in the form a few arguments:

1. Vendor lock-in is not a bad evil
2. The best way to benefit from the cloud is to go all in
3. AWS is the best cloud provider out there

I will try to walk through these points in this post.

## 1. Vendor lock-in is not a bad evil

[Avoiding vendor lock-in](http://fortune.com/2015/10/08/aws-lock-in-worry/) appears to be the common wisdom in the IT world, and a lot of people follow it without hesitation. But, increasingly, its validity within the context of modern software development [is being questioned](https://techbeacon.com/enterprise-it/dont-avoid-cloud-vendor-lock-embrace-it).

When people think of lock-in, they usually have the old days in mind. That’s when big companies used to sign multi-million dollar contracts with some big corporation (Microsoft or Oracle for example), and would find themselves completely stuck with that provider for a number of years. 

That, of course, was a problem. As the pace of technology increased, you’d find yourself unable to use the latest and greatest because of commitments that your company had with these providers. Moreover, the prospect of changing provider would often appear to be so painful and expensive to discourage everyone from even trying.

But that was a different time.

The question we should ask ourselves is whether that is still the truth in 2019. 

These days, vendor lock-in is something that a lot of people are happy to go along with. For example, many people own both a MacBook and an iPhone. That, if you ask me, is pretty locked in! If you’re one of those people, then the more Apple products you use, the more locked in you are. 

But the main difference here is that we have a choice. People choose to lock themselves into the Apple ecosystem because they they truly, genuinely like Apple. They love using those products on a daily basis. They feel so much more productive using such products that the thought of moving to a different manufacturer scares them way more than being locked in. 

In our normal, everyday life, we go with what works best for us. We adopt solutions from manufacturers/providers that offer us the best experience. We value those products so much that we don’t mind the fact that a potential migration to a product made by a different provider could be somewhat arduous.

## 2. The best way to benefit from the cloud is to go all-in

By going all-in with the cloud I mean taking advantage of everything that the cloud has to offer without trying to reinvent the wheel. Going half-hearted into the cloud simply doesn’t work. Here’s why.

**Lower cost and better performance**  
Cloud-native tools and products are cheaper and faster. The scale at which a big cloud provider can run something like a database is nearly impossible to achieve on your own. That’s why a cloud provider will always be able to offer such solutions at a much lower price (and with far greater performance) than if you were to run them on your own infrastructure. 

Even if you run, let’s say, Postgres on the cloud, it won’t usually be as cost effective as something that was built for the cloud from the ground up (e.g. DynamoDB or Aurora Serverless). 

**Pace of innovation**  
AWS releases new services on a weekly basis. At any given time, there may be a recently launched service that will most likely reduce costs, increase performance, and improve maintainability for your application. Adopting these new services can give you an advantage over your competitors and make your life easier. 

It’s important that you make it easy for yourself to *quickly* test and adopt a new service. The key to that agility is to reduce the amount of tools and services that you have to maintain by favouring serverless and managed services over things you have to install and configure yourself.

That’s how you get the most from the cloud, by paying them to do things you no longer want to worry about.


## 3. AWS is the best cloud provider out there

This is almost uncontroversial. Yes, Google [has claimed](http://fortune.com/2017/04/26/google-aws-cloud/) that they will surpass AWS in the next few years, and [Microsoft has been growing](https://beth.technology/microsoft-stock-overtake-amazon-cloud/) at an amazing pace. Nevertheless, if you use these services, you will soon notice how they don’t even compare to AWS. 


![Gartner’s “Magic Quadrant for Cloud IaaS” 2018](https://www.marcotroisi.com/images/aws-gartner-chart.png)


Google has done some great work, particularly in the area of [AI and machine learning](https://dialogflow.com/). A lot of people use Google just for that bit, and then rely on the other cloud providers for everything else. The most typical comment I hear from people who have tried Google Cloud after using AWS or Azure, is ‘they have some good stuff, but overall it looks like they’re not even trying!’. It’s truly amazing when you think of just how massive Google is. When you compare their cloud offering with Amazon’s, it’s tiny.

Microsoft is a different ball game. Here is a company that has been innovating (and growing) a lot. With the purchase of LinkedIn, GitHub, and with strong cloud products such as Office 365, they have a very strong offering. Microsoft Azure can be a valid option for some companies. However, AWS still offers the largest [depth of services](https://www.computerworlduk.com/cloud-computing/aws-ceo-talks-up-depth-of-services-over-competitors-3688501/) with 140 across many different categories. So if you go down the Azure route, the possibility of having to rely on AWS for some things is a real one.

## Conclusion

So-called **vendor lock-in in the modern era is nothing like it used to be**. If you feel that AWS is the right cloud provider for you (and we’ve established that there are very good reasons for thinking that), then you should embrace it fully. By doing so, you will leverage the amazing cost savings and increased performance that the cloud has to offer. 

**Resources**

- [“Ahead in the Cloud: Best Practices for Navigating the Future of Enterprise IT”](https://amzn.to/2FOHRjs) (book)
- [”Accelerate: The Science of Lean Software and DevOps: Building and Scaling High Performing Technology Organizations”](https://amzn.to/2YrHe6W) (book)
- [“Don't avoid cloud vendor lock-in. Embrace it”](https://techbeacon.com/enterprise-it/dont-avoid-cloud-vendor-lock-embrace-it)



*Image credit: Photo by [Dallas Reedy](https://unsplash.com/@dallasreedy?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/cloud?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)*

***Are you using AWS for your projects? What's your experience with it? Leave your impressions in the comments below.*** 
