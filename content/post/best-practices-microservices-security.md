---
author: Marco Troisi
categories:
- Microservices
- Security
date: 2017-02-17T08:20:55Z
description: "With security, reinventing the wheel is never a good idea. These 8 best practices for securing microservices are a good start."
draft: false
featured_image: "https://www.marcotroisi.com/images/best-security-practices-microservices.jpg"
layout: post
tags:
- microservices
- security
- oauth
- nacl
- docker
- aws
- clair
- prometheus
title: "8 best practices for microservices security"
url: /8-best-practices-microservices-security/
comments: true
---

<!-- MarkdownTOC depth="1" -->

- [1. Use OAuth for user identity and access control](#1-use-oauth-for-user-identity-and-access-control)
- [2. Use 'defence in depth' to prioritize key services](#2-use-defence-in-depth-to-prioritize-key-services)
- [3. Don’t write your own crypto code](#3-don’t-write-your-own-crypto-code)
- [4. Use automatic security updates](#4-use-automatic-security-updates)
- [5. Use a distributed firewall with centralized control](#5-use-a-distributed-firewall-with-centralized-control)
- [6. Get your containers out of the public network](#6-get-your-containers-out-of-the-public-network)
- [7. Use security scanners for your containers](#7-use-security-scanners-for-your-containers)
- [8. Monitor everything with a tool](#8-monitor-everything-with-a-tool)
- [Don't reinvent the wheel](#dont-reinvent-the-wheel)

<!-- /MarkdownTOC -->


There is virtually no situation in software architecture that entirely frees you from security considerations. With microservices, some issues become more distinct and a lot harder. However, there are also [a few features](https://techbeacon.com/4-ways-exploit-microservices-architecture-better-app-sec) of [microservices](https://techbeacon.com/4-ways-exploit-microservices-architecture-better-app-sec) [that can bolster security](https://techbeacon.com/4-ways-exploit-microservices-architecture-better-app-sec).

With microservices, the network is still a bottleneck. Things like access control, which the industry already understands thoroughly within the realm of monolithic applications, assumes a new, almost unexpected, level of complexity. This paves the way for debates and scrutiny over whether a microservices architecture actually solves more problems than it creates. [Your decision to use microservices](http://marcotroisi.com/when-to-use-microservices-video) should always be conditional.

When you've done your due diligence and decided that microservices are right for you, it's time to make sure that all of your applications' security demands are met. Here are eight best practices for securing your microservices.

<a name="1-use-oauth-for-user-identity-and-access-control"></a>
## 1. Use OAuth for user identity and access control

The overwhelming majority of applications are going to need to perform some level of [access control](https://blog.joefallon.net/2011/03/access-control-vs-authorization/) and [authorization handling](http://priocept.com/2011/08/30/authentication-vs-authorisation-vs-access-control/). What you want to avoid here is reinventing the wheel. [OAuth](https://oauth.net/)/[OAuth2](https://oauth.net/2/) is practically the industry standard as far as user authorization goes. While building your own custom authorization protocol is clearly an option, [many out there](https://stormpath.com/blog/secure-your-rest-api-right-way) don't recommend it unless you have strong and very specific reasons for doing so.

While OAuth2 [isn't perfect](https://techbeacon.com/state-social-authentication-oauth-job), it's a widely adopted standard. The advantage of using it is that you can rely on libraries and platforms that will greatly accelerate your development phase. By the same token, [several solutions](https://blog.pivotal.io/pivotal-cloud-foundry/products/securing-restful-web-services-with-oauth2) for improving the security level of your OAuth-based authorization service have already been built by some of the biggest companies and smartest engineers around.

<a name="2-use-defence-in-depth-to-prioritize-key-services"></a>
## 2. Use 'defence in depth' to prioritize key services

Assuming that a firewall on your network perimeter is enough to protect your software is a big mistake. "[Defense in depth](http://www.theregister.co.uk/2016/04/15/defence_in_depth/)" is [defined](http://en.wikipedia.org/wiki/Defense_in_depth_(computing)) as "an information assurance concept in which multiple layers of security controls (defense) are placed throughout an information technology system."

In plain English, what you need to do is identify what your most sensitive services are, and apply a number of different layers of security to them, so that a potential attacker who is able to exploit one of your security layers will still have to figure out a way to beat all your other defenses on your critical services. This is by all accounts easier said than done, but [several resources](http://www.amazon.com/Network-Perimeter-Security-Building-Depth/dp/0849316286) are [available](https://www.infoq.com/news/2016/08/secure-docker-microservices).

Security is typically a job better left to experts and not to amateurs. A proper defense in depth strategy is more likely to succeed if it's established by people who actually know what they're doing.

What's great about microservices is that they make it easier to adopt this strategy in a very granular and strategic way—by focusing your security efforts and resources on specific microservices. The architecture also makes it easier for you to diversify the layers of security you wish to adopt on each microservice. By so doing, an attacker who is able to exploit one of your services may not necessarily be able to figure out how to exploit the second one.

<a name="3-don’t-write-your-own-crypto-code"></a>
## 3. Don’t write your own crypto code

Over the years, many people have invested incredible amounts of money, time, and resources into building libraries that handle encryption and decryption. If you hired 10 smart and competent security people, put them all in a room and asked them to come up with the best possible library for encryption and decryption, I doubt they would come up with something as good as the best open source crypto libraries that are already out there.

Most of the time, when it comes to security you shouldn't try to roll your own new solutions and algorithms unless you've got strong and specific reasons to, and you've got people skilled enough to create something nearly as good as the open source tools already available (tools that have been heavily battle tested by the community).

In most cases, you should use [NaCl](http://nacl.cr.yp.to/index.html)/[libsodium](https://download.libsodium.org/doc/) for encryption. It's been around for several and it's fast, easy to use, and secure. While the original implementation of NaCl is [written in C](https://en.wikipedia.org/wiki/NaCl_(software)#Implementations), it also supports [C++ and Python](https://nacl.cr.yp.to/features.html). And thanks to the libsodium fork, several adapters for other languages like [PHP](https://github.com/jedisct1/libsodium-php), [Javascript](https://www.npmjs.com/package/libsodium), and [Go](https://github.com/GoKillers/libsodium-go) are available.

This section wouldn't be complete without mentioning the wildly popular [Bouncy Castle](https://www.bouncycastle.org/) library. If you're working with Java or C#, your best bet is to go with this one. If you want to learn more about encryption, read this [developer's guide](https://techbeacon.com/software-engineers-guide-encryption-how-not-fail).

<a name="4-use-automatic-security-updates"></a>
## 4. Use automatic security updates

If you want your microservices architecture to be secure and scalable at the same time, it's a good idea—in the early development phase—to figure out a way to automate or at least keep all of your software updates under control.

High testing coverage here is more essential than ever. Every time a part of your system is updated, you want to make sure you catch any issue early enough and in as much detail as possible.

Make sure that your platform is mostly "atomic". What that means is that [everything should be wrapped within containers](https://techbeacon.com/3-reasons-why-you-should-always-run-microservices-apps-containers) so that testing your application with an updated library or language version is just a matter of wrapping a different container around it. Should the operation fail, reversing everything is fairly easy and, most importantly, can be automated.

[CoreOS](https://coreos.com/), RedHat's [Atomic Linux](http://www.projectatomic.io/), and Ubuntu's [Snappy Core](https://developer.ubuntu.com/en/snappy/) are also projects you want to keep an eye on, as they try to bring about the same concept on an OS level.

<a name="5-use-a-distributed-firewall-with-centralized-control"></a>
## 5. Use a distributed firewall with centralized control

For the most part, this is still uncharted territory, but I believe that a firewall that allows users more granular control over each and every microservice (as attempted by [Project Calico](https://www.projectcalico.org/)) has got to be the way we build firewalls for microservices. If not now, at least at some point in the future.

<a name="6-get-your-containers-out-of-the-public-network"></a>
## 6. Get your containers out of the public network

Amazon, with their [AWS API gateway](https://aws.amazon.com/api-gateway/), probably made this whole notion more mainstream and easy to adopt than anyone else before.

An API gateway establishes a single entry point for all requests coming from all clients. It subsequently knows how to provide an interface for all of your microservices.

By using this technique you can secure all of your microservices behind a firewall, allowing the API gateway to handle external requests and then talk to the microservices behind the firewall.

Moreover, as the [Netflix experience](http://techblog.netflix.com/2012/07/embracing-differences-inside-netflix.html) teaches us, using an API gateway is a great way to optimize requests based on the client, especially in the case of mobile devices.

<a name="7-use-security-scanners-for-your-containers"></a>
## 7. Use security scanners for your containers

Within your automated testing suite, it would make sense to include periodic vulnerability and security scanning for your containers. The chief open source actor in this space appears to be [Clair](https://coreos.com/clair/docs/latest/), from CoreOS. Docker Security Scanning and Twistlock are a couple of commercial options.

Something else to keep in mind here is that the container image itself may not necessarily be trusted unless its signature has been verified. [rkt](https://coreos.com/rkt/) does that by default, while Docker introduced [a similar feature](https://blog.docker.com/2015/08/content-trust-docker-1-8/) a while ago after [several security vulnerabilities](https://groups.google.com/forum/#!msg/docker-user/nFAz-B-n4Bw/0wr3wvLsnUwJ) were found.

<a name="8-monitor-everything-with-a-tool"></a>
## 8. Monitor everything with a tool

You can't afford to run a distributed system without a solid, advanced, and reliable monitoring platform. Several solutions are available out there, but the one that was built specifically with microservices in mind and has been around the block is [Prometheus](https://prometheus.io/).

Built originally by engineers at [SoundCloud](https://soundcloud.com/), Prometheus is an open source monitoring platform and a part of the [Cloud Native Computing Foundation](https://cncf.io/). It's being supported and adopted by some of the biggest players in the industry, like SoundCloud themselves, CoreOS, and Digital Ocean.

Other monitoring solutions include [InfluxDB](https://influxdata.com/), [statsd](https://github.com/etsy/statsd) and several well-known commercial platforms.

<a name="dont-reinvent-the-wheel"></a>
## Don't reinvent the wheel

While the above is not intended to be an exhaustive list, it touches on the issues you are most likely to face when building applications based on a microservices architecture.

When it comes to security, reinventing the wheel is rarely a good idea. Always be researching the best practices adopted by the industry and suggested by experts.

***What are the best practices or resources on which you rely for securing microservices? Share in the comments below.***

***

*Here are some additional resources I've bookmarked:*

- [Project Cockpit](http://cockpit-project.org/) - administer your Linux servers via a web browser
- [Securing Micro-services with a Distributed Firewall](https://www.youtube.com/watch?v=44wOK9ObAzk) (video)
- [Docker and High Security Microservices](https://www.infoq.com/news/2016/08/secure-docker-microservices)
- [Defense in depth conference](http://redhatdefenseindepth.com/)
- [Network Perimeter Security: Building Defense In-Depth](http://amzn.to/2ig8m7i) (book)
- [Docker Containers: Build and Deploy with Kubernetes, Flannel, Cockpit, and Atomic (Negus Live Linux)](http://amzn.to/2iBcUD9) (book)
- [Container Defense in Depth](http://thenewstack.io/container-defense-depth/) 
- [API gateway pattern](http://microservices.io/patterns/apigateway.html)

***This article was first published on [TechBeacon](https://techbeacon.com/8-best-practices-microservices-security).***





