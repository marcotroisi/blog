---
title: An example of a Microservice
description: "I built a Microservice to use as an example to walk through. See how easy it is to build one for yourself!"
author: Marco Troisi
layout: post
date: 2015-04-14
url: /an-example-of-a-microservice/
categories:
  - Fat Free framework
  - PHP
  - Software Development
  - Technology
tags:
  - microservices
  - microtranslator
  - php
featured_image: "http://www.marcotroisi.com/wp-content/uploads/2015/04/microtranslator.png"

---
After writing on [Microservices][1], I received a few feedbacks from people who found the topic fascinating but struggled to see how to effectively apply it in reality. So I decided to develop a little microservice, to use as a practical example. <!--more-->

## Introducing MicroTranslator

**[MicroTranslator][2]** is a microservice that I have built, which is supposed to handle locale and translations in an application. Its tech stack is the following:

  * PHP >= 5.4
  * [Fat Free framework][3]
  * [Moss Locale][4]
  * [MongoDB][5]

<del datetime="2015-07-20T07:04:33+00:00"><em><strong>Note:</strong> at the time of this writing (14 Apr &#8217;15) I am still working on MicroTranslator. It will be production-ready (documentation included) in a few days. Sorry about that!</em></del>

## It comes with REST API

MicroTranslator provides simple-to-use REST API. For this reason, you need to know little to no PHP to use it. Simply fire up an instance of PHP on whatever machine you like, and then use the APIs to get the translations on the other Microservices that compose your application.

Now this is important, in my opinion. It means that you can quickly begin working on your application without having to focus on a tedious task such as handling translations, but also that, at any point in time, you can completely get rid of it and rewrite it with, perhaps, a faster language. Or you can simply upgrade your hardware and keep relying on it.

## &#8220;I could have done this myself&#8221;

You may think now, &#8220;why should I use your stuff when I can write my own translation manager, using the tools that I like the most?&#8221; The simple answer here is &#8220;You shouldn&#8217;t (use my translation manager)!&#8221;

But I would also like to point out that, unless translations represent the core of your application, there is no reason why you would want to waste your time rewriting a library that does the same thing. But even if you do, what you should be avoiding is to tie it all up with the rest of your application. Using a Microservices architecture will allow you to _replace_ parts of your application quickly and seamlessly. And, it will give you the power of choosing the right tools, framework, database, etc for the task.

## Point by point

Like I said, one of the reasons why I worked on MicroTranslator is because I wanted to create a real-life example out of my previous article on _what is a Microservice_.

Let&#8217;s have a look at the points I outlined back then:

  1. **It is a Stand-alone service/application.**: Yes, MicroTranslator is stand-alone. It doesn&#8217;t need, and actually, it doesn&#8217;t want, to be included into your PHP application. You can connect to it, get and send to it all the data that you need, but you will not find MicroTranslator-specific code in your application. Just generic API calls.
  2. **It is quick to (re)write.**: Absolutely! I wrote MicroTranslator in a weekend plus a few other free hours during the week. You can totally rewrite it in a week or less as soon as you feel like it.
  3. **It focuses on one task**: It only cares about your translations. It doesn&#8217;t even want to know how you use them.
  4. **It is Language-agnostic.**: Well, MicroTranslator is clearly written in PHP, but you can use its APIs from application, regardless of the language/framework/tools you are using.
  5. **It is aware of failures**. This clearly depends on the rest of the application. But, for example, you can cache the translations that you get from MicroTranslator, so that, should it be unreachable at a certain point in time, you can still handle the situation graciously. One thing is sure: if MicroTranslator goes down, it won&#8217;t _directly_ affect your main application.

## In practice, it&#8217;s not that difficult

It&#8217;s amazing how simple things can look like when we see them in real-life examples. In fact, despite the buzzword-mania and all the hype around Microservices, something that we often fail to understand is how simple they are. Building a Microservice is as simple as a few days of work. Building an entire application based on a Microservices Architecture is as simple as being able to separate everything into small services/applications that are only concerned about one little thing, and they do that _very well_. This is, by the way, also one the keys of greater [productivity][6].

**_Question: have you already tried to build a Microservice, or even an entire application based on a Microservices architecture? I would love to have a look and learn from you as well. Share your work on [Facebook][7] or [Twitter][8]._**

 [1]: http://www.marcotroisi.com/micro-services-a-quick-introduction/
 [2]: https://github.com/marcotroisi/microtranslator
 [3]: http://www.fatfreeframework.com
 [4]: https://github.com/mossphp/moss-locale
 [5]: http://www.mongodb.com
 [6]: http://www.marcotroisi.com/productive-programmer-5-tips/
 [7]: http://www.facebook.com/sharer/sharer.php?u=http://www.marcotroisi.com/an-example-of-a-microservice/
 [8]: https://twitter.com/intent/tweet?original_referer=http://www.marcotroisi.com/an-example-of-a-microservice/&source=tweetbutton&text=%3F&url=http://goo.gl/KdOum9&via=marcotroisi
