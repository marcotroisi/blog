---
author: Marco Troisi
categories:
- Software Development
- Code Reviews
date: 2017-05-26T11:46:11Z
description: "As a code reviewer, keeping code readable and maintainable is job one. Learn how to spot overly complex code—and simplify it."
draft: false
featured_image: 'http://www.marcotroisi.com/images/simplicity-abstraction.jpg'
layout: post
tags:
- code reviews
- abstraction
- imperative
- declarative
- decompose conditional
- consolidate conditional expression
title: "Basic abstraction techniques: What code reviewers need to know"
url: /basic-abstraction-techniques-what-code-reviewers-need-know/
---

While having a large amount of code doesn't necessarily mean the code is complex, there certainly is such a thing as *too much code in the wrong place*. Programming code can also be unnecessarily complex and hard to follow. As a matter of fact, these two problems often occur together, and it's something you need to be on the lookout for as a [code reviewer](https://techbeacon.com/how-run-code-reviews-your-dev-teams-workflow).

What's usually lacking in those parts of code where you find yourself on the verge of throwing in the towel because you just can't understand what is going on is what we call *[abstraction](https://en.wikipedia.org/wiki/Abstraction_(software_engineering))*. When sections of code get too cumbersome and hard to follow, that's when you need to employ an abstraction technique. Let's look at how to spot overly complex code and then simplify it.

## The power of abstraction

Two of the main paradigms of computer programming are *[imperative](https://en.wikipedia.org/wiki/Imperative_programming)* and *[declarative](https://en.wikipedia.org/wiki/Declarative_programming)*. To put it simply, imperative programming means telling the compiler how to do things, line by line. Declarative programming, on the other hand, abstracts away the *details* of how things are done, in favor of a high-level description of what needs to be done.

The reason declarative programming is deemed by many to be a [superior](https://tylermcginnis.com/imperative-vs-declarative-programming/) way to write code is that it's often a lot easier to read someone else's declarative code than something written imperatively. When you read and work on declarative code, you don't need to bother with implementation details. You can, instead, focus on the general business logic and only look at the specific implementation of something if you need to.

## Too much code?

For code to be easier to read and understand, its business logic should be as obvious as possible. And for that to happen, there needs to be as few "implementation details" floating around as possible.

As an example, look at the following procedural/imperative piece of code:

```js
let userId = "2"
let address = "20 Gortnatra St., Kerrykeel, County Donegal, Ireland"
let supergeocoder = new SuperGeocoder()
let geocoder = supergeocoder({provider: "google-maps"})
let geocoderResult = geocoder.geocode(address)
let gpsCoords = geocoderResult.latitude + ',' + geocoderResult.longitude
let mysql = new MySql();
let connection = mysql.createConnection({
  host : 'localhost',
  user : 'me',
  password : 'secret',
  database : 'my_db'
});
connection.connect();
connection.query('UPDATE users SET address = ?, gps = ? WHERE id = ?', [address, gpsCoords, userId], function (error, results, fields) {
  if (error) throw error;
  // ...
});
connection.end();
```

It wouldn't be surprising if it took even an experienced developer several moments to understand what that piece of code is trying to achieve. This is how we could attempt to make it declarative:

```js
let userId = "2"
let address = "20 Gortnatra St., County Donegal, Ireland"
let User = new User(userId)
let Geolocation = new Geolocation()
User.saveAddressCoordinates( Geolocation.coordinatesFromAddress(address) )
```

The main thing that we've done here is remove all the implementation details, such as the database and the geolocation library. We've also gotten rid of some database-specific language, such as the SQL query and the database connection data.

Now anyone can read that segment of code and have a pretty clear idea of what its business logic is. The code is clearly trying to save the user's GPS coordinates by calculating them from a real address.

When reviewing someone else's code, look for places where implementation details are hindering a clear understanding of the business logic. Suggest practical ways to abstract away the *what*, leaving only the *how* exposed. The easiest way to do that is typically by replacing that piece of implementation code with a small function or object, as shown in the above example.

## Decompose conditional

Another place where you can find too much code in the wrong place is within *if* conditions. When reading an *if* condition it should, again, be immediately obvious to any reader what that condition is trying to accomplish.

Look at the following segment of code:

```js
if (
    (
        Person.age > 65
        && Person.gender == Person.GENDER_FEMALE
        || Person.age > 67
        && Person.gender == Person.GENDER_MALE
    ) &&
    Job.employeeDetails(Person).employedSince >= 1980
) {
    // some code here
}
```

This huge condition should be replaced by a simple function such as this:

```js
if (isEligibleForRetirement(Person, Job)) {
    // some code here
}
```

*isEligibleForRetirement* simply contains all of the conditions we’ve just looked at, but it's much easier to read, understand, and test. This technique is called *[decompose conditional](https://refactoring.com/catalog/decomposeConditional.html)*.

Once again, what you're looking for here is a way to understand the business logic *clearly* and as early as possible while in the process of reading the code.

In the first condition, even after reading it all, you probably still wouldn't know what that *if* is trying to do, which is to scan through people who are eligible for retirement. A [comment](https://techbeacon.com/useless-comments-can-ruin-code-review-heres-how-erase-them) might have been necessary for you to fully understand it.

In the second condition, it's immediately clear what the business logic is. Unless you care about the specific requirements for a person to be eligible for retirement, you can happily keep reading the rest of the code.

## Consolidate conditional expression

Something else to be on the lookout for is when a number of conditions return the same result.

Here’s what it would look like:

```js
if (Job.position == “truck_driver”) {
    if (Applicant.age > 65) {
        return false
    }
    if (!Applicant.hasDrivingLicence()) {
        return false
    }
    if (Applicant.hasCriminalRecord()) {
        return false
    }

    Job.sendApplication(Applicant)
    return true
}
```

There are a number of reasons why something like this might happen. One of them might be that different developers have been adding those conditions one after the other and have never stopped to think about [refactoring](https://techbeacon.com/17-opinions-resources-rewrites-vs-refactoring) the code, sacrificing long-term maintainability in favor of getting the code quickly into production (thereby creating [technical debt](https://techbeacon.com/get-grip-technical-debt)).

In the example above, being above a certain age, having a driver's license, and lacking a criminal record are clearly all necessary requirements for the job. The three if conditions can be replaced by a single condition:

```js
if (!Applicant.isEligible()) {
    return false
}
```

As you'd expect, *isEligible()* will simply contain all of those conditions. The result is something that is much cleaner and easier to read.

This refactoring operation is called *[consolidate conditional expression](https://sourcemaking.com/refactoring/consolidate-conditional-expression)*, and it’s a very valuable tool that can be used to make code more concise and easy to read.

## Too much code in the wrong place

As you can see, in all of the cases we’ve looked at, the complexity wasn’t due to the code not being correct or necessary. Rather, the main problem was that it was in the wrong place.

Code like that should be abstracted away. It occupies valuable space and slows down the reading of anyone who wants to use and understand that code.

## The value of code reusability

Code reusability is at the heart of good software. And for the code to be reused, it's essential that it be readable and easy to understand.

It’s very important for a code reviewer to keep an eye out for pieces of code that require a great amount of time to be fully understood. Very often, the practical techniques shown in this article will help you abstract away that complexity.

When there is too much code in the wrong place, it becomes much harder to read and understand it. You should always be hesitant to approve code that requires significant effort to be understood. When the business logic is not broadly clear after a first reading of the code, a red flag should be raised, and techniques such as the ones listed in this article should be used to simplify the code and abstract away the complexity.

*Image credit: [Flickr](https://flic.kr/p/eM7hLB)*

***Share your abstraction techniques in the comments section below!***

*** 

***This article was first published on [TechBeacon](https://techbeacon.com/basic-abstraction-techniques-what-code-reviewers-need-know).***
