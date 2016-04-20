---
title: Technical debt is not a unicorn
description: "Technical debt is not an abstract concept. It has real and serious effects, and can be avoided."
author: Marco Troisi
layout: post
date: 2015-11-04
url: /technical-debt-is-not-a-unicorn/
categories:
  - Opinions
  - Software Development
  - Startups
  - Technology
tags:
  - architecture
  - refactoring
  - technical debt
featured_image: "http://www.marcotroisi.com/wp-content/uploads/2015/11/sanfrancisco_800.jpg"

---
Amongst software engineers, there is this thing called _technical debt_ that is very often talked about and that tends to have somewhat of an ethereal nature.

Almost every company will have the technical debt prophet who will try to convince her people that doing what &#8220;feels good&#8221; now is not going to pay off down the line, and that &#8220;future generations&#8221; will have to pay for it. But, almost inevitably, choices will be made that will inescapably lead to some degree of technical debt.<!--more-->

The list of things that feel good now includes but is not limited to: shipping as fast as possible, making the manager happy, getting back to those hilarious videos on youtube, etc.

The problem is that sometimes we fail to understand how much of a damage are we actually making with those poor choices being implemented.

## Business and codebase should grow together

### The first stage of growth

Think of the Business side of your company and its software codebase as two parts of the whole picture that should be growing and maturing together. So, for example, when the company is at its early stages, and the way everything is being run is very simple and lean because there isn&#8217;t much to be run anyway, the software should also be really down to the basics. No unnecessary complexity, no premature optimisation. Keep it simple, keep it [clean][1]. Write the cleanest code you possibly can, rely on a rock-solid, time tested set of tools. Don&#8217;t adventure in something that you _think_ will be useful as you grow, rather make sure that you make it as easy as possible to transition the software to a different framework, database, architecture (e.g. a [Microservices][2] architecture).

### The second stage of growth

As the company begins to gain traction, there will be a time of relatively rapid growth. The company is going from literally zero to hundreds or thousands of people using the particular services they offer. At this time, it will begin to become evident whether good choices were made in the prior stage; it should be very easy to change anything based on a new decision from the managers or, perhaps, from the customer&#8217;s feedback. Changing anything should be a matter of hours, not days. Implementing a new feature should be an absolute pleasure. No important architectural change should be necessary in order for the whole platfom to keep functioning even in the face of thousands of new users being added daily. Of course, things like implementing a new cache layer to ease the pressure on the servers, or adding a new cluster for the database, are okay. But no discussion about changing framework, or adopting a new database should take place. If the framework or database adopted can&#8217;t handle this type of pressure nicely, then someone made a very incompetent choice at the previous level, the one where this type of decisions were made. But ideally, all modern frameworks and databases should be able to manage the amount of traffic that is happening at this particular stage.

### The third stage of growth

The third stage would be the one of multiplication. At this point, the company is so successful that it may want to launch its services abroad. As the product is already popular enough in its home country, say the US, you&#8217;d expect that on day one of the launch to the next territory, say Europe, you&#8217;d have to handle hundreds of thousands of new users, with support for multiple languages and a whole lot of things that will have to be customised on a single Country basis. This is the time where considerations like, &#8220;should we switch framework&#8221; or &#8220;can our database handle this much&#8221; are more than appropriate. Here more than anywhere else, it will become evident whether everyone did his/her job properly. If good choices were made and everyone acted like a professional at the prior stages, moving from one database to another, adopting a different framework, or switching to a more scalable architecture, should only be a matter of days. But, most importantly, the key people in the team should have a clear path in their mind of what needs to be done in order for that transition to take place. There should be no guessing.

## Technical debt is suicide

Just like any other debt, technical debt will only lead to bad things. And as it increases, the chances of a company succeeding are going to be greatly diminished. There is an inversely proportional relationship between the two.

Now imagine the opposite situation, of a company that does it all wrong. It would look something like this: at the first stage of growth, there would be two plausible scenarios. The first, would be that of premature optimisation with unnecessary choices and decisions being made, because of incompetent leaders and programmers who think their little company should have the same scalability that Google has. Days, weeks, are wasted implementing layers of caching and database clusters, and setting up complex development and deployment tools, without even enough people to maintain all this stuff. If anything breaks, the CTO, a team lead or a senior engineer needs to spend a day or two fixing the problem because there aren&#8217;t even enough people to take care of it (you don&#8217;t usually have devops or system people in a small startup). The growth of the company is slowed down, and you&#8217;re lucky if it succeeds at all.

The second scenario would be that of someone who wants to avoid at any cost the first scenario, and decides that, after all, the only thing that matters is for the company to keep growing as fast as possible. They won&#8217;t waste an hour more on a ticket in order to write tests and to make sure the code is clean. They won&#8217;t make sure it&#8217;s easy at any point in future to switch database or even adopt a different ORM library. The _illusion_ of this scenario is that it is likely to get the company to the second stage of growth, even if at the cost of a few late nights and weekends spent fixing bugs and an overall unstable platform.

At the second stage of growth, coming from the second scenario, choices that should have been made at the third stage, like switching to a different database or a change of architecture, will become necessary because the platform can&#8217;t even handle the few thousands of new users that are being added on a periodic basis. What&#8217;s even worse, a rewriting of many parts or the codebase will become inevitable and a lot of time will have to be spent desperately trying to raise the percentage of code covered by some sort of test.

For the company coming from the first scenario, it won&#8217;t look too different. A lof of technical choices that had been made in the first stage will be shown as wrong for the actual needs of this specific platform, and so again time will have to be spent switching and rewriting.

It&#8217;s hard to imagine a company getting to the third stage of growth under these circumstances, but if it does, it should look similar to what it would have looked like in normal conditions. But, again, it&#8217;s unlikely to get there, and if it does, so much time and money will have been wasted to get here, that it will be hard to justify again any change or rewriting, though this is the only stage where those things would have actually made sense. It&#8217;s also likely that a few key people in the engineering team has been replaced because of their incompetence, adding to everything else the costs of having to introduce new people and mosts importantly new leaders.

## Avoiding technical debt

Technical debt exists, it&#8217;s real and it can be proven, almost touched. It&#8217;s not a myth, and the first step to avoiding it is realising how damaging it can be. Doing things right will not only lead to building a successful platfom serving happy customers. It will also be a lot more fun. It&#8217;s way more enjoyable to work on clean code, to be able to introduce a new feature in a matter of hours and not weeks. It&#8217;s a lot better to spend time solving real problems rather than fixing bugs. And of course, no one wants to work late nights and weekends if it&#8217;s not absolutely necessary.

## More resources

### To Read

  * [The clean architecture][1] (Uncle Bob Martin)
  * <a rel="nofollow" href="http://www.amazon.com/gp/product/0132350882/ref=as_li_tl?ie=UTF8&#038;camp=1789&#038;creative=390957&#038;creativeASIN=0132350882&#038;linkCode=as2&#038;tag=marctroi-20&#038;linkId=7KDRFWMKHKFMNWAR">Clean Code: A Handbook of Agile Software Craftsmanship</a> <img src="http://ir-na.amazon-adsystem.com/e/ir?t=marctroi-20&#038;l=as2&#038;o=1&#038;a=0132350882" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />(Uncle Bob Martin)
  * <a rel="nofollow" href="http://www.amazon.com/gp/product/1617292397/ref=as_li_tl?ie=UTF8&#038;camp=1789&#038;creative=390957&#038;creativeASIN=1617292397&#038;linkCode=as2&#038;tag=marctroi-20&#038;linkId=CVFNNRQ23ADXVH4O">Soft Skills: The software developer&#8217;s life manual</a> <img src="http://ir-na.amazon-adsystem.com/e/ir?t=marctroi-20&#038;l=as2&#038;o=1&#038;a=1617292397" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />(John Sonmez)

### To Watch

  * [Architecture: the lost years][3] (Uncle Bob Martin)
  * [Workflows of refactoring][4] (Martin Fowler)

 [1]: https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html
 [2]: http://www.marcotroisi.com/micro-services-a-quick-introduction/
 [3]: https://www.youtube.com/watch?v=HhNIttd87xs
 [4]: https://www.youtube.com/watch?v=vqEg37e4Mkw&list=PLJb2p0qX8R_r3crCVAxp57dvoqGGjD3yD
