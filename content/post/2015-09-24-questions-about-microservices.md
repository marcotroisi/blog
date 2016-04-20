---
title: A Question about Microservices
description: "A question on how to approach a microservices architecture, authentication, and over-bloated frameworks."
author: Marco Troisi
layout: post
date: 2015-09-24
url: /questions-about-microservices/
categories:
  - Software Development
  - Technology
tags:
  - authentication
  - golang
  - kong
  - microservices

---
I received this question about microservices, and I am happy to publish my reply. Perhaps someone else will also find it helpful.

> Hello Marco,
>
> I&#8217;ve just stumbled upon your articles about microservices. I&#8217;m really trying to get into it, I find it a really interesting approach when it comes to build web apps. I got bored with all those frameworks claiming MVC etc. What I want to focus on is SOC, so microservices really fits in there. However I didn&#8217;t have time yet to practice what I could have read on that, and there are still things that are pretty obscure to me, maybe you could give me your point of view.

<!--more-->

> My main concern is about information sharing between services. What happens when a microservice is &#8220;linked&#8221; to another one ? If I take your example of WordPress refactoring, you&#8217;re for example stating that there could be a Post and Media Content microservices. But here, the media content microservices isn&#8217;t really standalone as it wouldn&#8217;t make sense to use it without the Post microservice, because Media Content is directly attached to a Post, see what I mean ? It sounds kind of weird to me, but maybe I&#8217;m wrong.
>
> Also my second point would be about user authentication. How do you persist the state between microservices ? Do you have an example of that ?
>
> Thanks for the articles, Waiting to hear from you.
>
> Regards,
>
> Romain

* * *

Dear Romain,

Thanks for reading my article on microservices, I appreciate it. Like you, I am also sick and tired of big, overbloated frameworks that claim to do everything for you, including making your coffee in the morning. While they may be a good choice in certain situations, I think many times they just add a lot of unnecessary complexity, unnecessary _ad hoc_ concepts to be learned, and most importantly, unnecessary (potentially buggy) code that you haven&#8217;t written yourself. These days I find myself more inclined towards micro-frameworks, or even simple libraries that do just one thing; an example I love would be [Gorilla][1], a Golang set of standalone libraries that take care of most of the functionalities for which we would have traditionally used a framework.

As to your question, let me see if I can somehow help you here. When you say &#8220;linked&#8221;, I take it that you mean a microservice that&#8217;s _usually_ (or, meant to be) used in conjunction with one or more other microservices. But that, when you think about it, is nothing strange! In fact, any microservice that would be meant to be only used on its own, would simply be a small monolith. For a microservice to be considered as such, it needs to be part of a **microservices architecture**, that is to say, a bigger application that does a lot of things, and that uses microservices to do each one of those things.

But I get where your doubt is coming from. You are thinking about the Media Content example, and it doesn&#8217;t feel to you like a standalone service as it would never be used separately from the Post microservice. I see two main problems in this reasoning.

Firstly, the idea of standalone-_ness_ in a microservices architecture is meant to be mostly for the sake of the application&#8217;s solidity; in other words, you ought to think of the Post microservice as a standalone service not because you want to use it as such (in fact, you don&#8217;t! You want to use it together with Media, and maybe other services), but because in the event where the Media microservice should be unavailable (e.g. due to a network problem), you don&#8217;t want the entire application to be altogether down. What you want there, is for the Posts to be still available, even though you might have to gracefully handle the absence of pictures and videos.

I hope this gives you the right perspective. The idea is that you build a microservice independently, and you test it on its own, so to make sure that it will keep working even when other services are unavailable. Then, you mix it with the other microservices.

The second problem I see there is that, while I agree that Media will mostly be used in conjunction with the Post microservice, nevertheless you shouldn&#8217;t think of them as _only_ usable together. If you keep things clean and separated, you will be better off in the future, as you never know what functionalities you are going to need as you move on. Think for example of a service that takes pictures from your Media microservice and send them to your Pinterest account using Pinterest&#8217;s APIs. In this case, you don&#8217;t really need the Post microservice, and it would be just one example of a situation where you need Media but you don&#8217;t need Post. So the real point here is the _separation of concerns_. Let each microservice do only one thing, and do it well. Let the Media microservice handle upload, resize, manipulation and what-have-you. Let the Post microservice handle the actual content and things like Markdown to HTML conversion (which could probably be another microservice anyway), and so on.

Regarding your second question about authentication, I would advice you make use of a layer that will take care of receiving requests from the outside, handle the user authentication, and then route the request to the appropriate microservice (together with _at least_ a secret token, or something more sophisticated if you will), get the result from the microservice and send it back to user. Have a look at [Kong][2] for a reference and a better idea of what I am talking about (warning: it might be overhead for certain projects, but just so you have an idea).

Here are more resources for you, so you can go more in depth with these arguments:

  * [Make the magic go away (Uncle Bob)][3], on the notion of not using overbloated frameworks!
  * [Building Microservices (Sam Newman)][4]<img src="http://ir-na.amazon-adsystem.com/e/ir?t=marctroi-20&#038;l=as2&#038;o=1&#038;a=1491950358" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
  * [Microservices.io][5], lots of fine articles to give you a better overview of a microservices archicture, the good and the bad
  * [Microservices guide (Martin Fowler)][6]
  * [Netflix and Microservices][7]

I wish you a lot of fun with microservices and your next project,

Marco

**If you&#8217;d like to send me your questions or suggestions, feel free to [contact me][8]**!

 [1]: http://www.gorillatoolkit.org/
 [2]: https://getkong.org/
 [3]: https://blog.8thlight.com/uncle-bob/2015/08/06/let-the-magic-die.html
 [4]: http://www.amazon.com/gp/product/1491950358/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=1491950358&linkCode=as2&tag=marctroi-20&linkId=J656A6LG3XRMA3J4
 [5]: http://microservices.io/
 [6]: http://martinfowler.com/articles/microservices.html
 [7]: http://techblog.netflix.com/2015/02/a-microscope-on-microservices.html
 [8]: http://www.marcotroisi.com/contact/
