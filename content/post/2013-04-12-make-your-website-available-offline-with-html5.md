---
title: Make your website available offline with HTML5
author: Marco Troisi
layout: post
date: 2013-04-12
url: /make-your-website-available-offline-with-html5/
categories:
  - HTML5
  - Mobile
  - Tutorials
tags:
  - appcache
  - chrome
  - firefox
  - html5
  - manifest
  - mobile
  - offline

---
One of the really cool things **HTML5** allows to do is to make our web apps available even when our visitors are not connected to any network (assuming, obviously, that they have visited the website before, under network coverage).
  
<!--more-->

While it is to be said that this feature (called **_AppCache_**) might not be useful/appropriate for many websites, it still remains a great feature that is going to positively affect the web in the next years, offering a much better user experience and giving a new reason to developers and companies for developing just one great HTML5 web app instead of _a lot_ of native applications.

The use of the application cache feature can give some benefits to your web app, such as:
  
&#8211; **Offline browsing**: clearly, that is the main advantage
  
&#8211; **Speed**: Resources are downloaded and therefore faster to load when a user visit your website
  
&#8211; **Less charge to the server**: as it only have to download resources that have been changed

## Let&#8217;s make your website available offline

The first thing you have to do is to **create a manifest** that will list all the resources you want the local device to download. This manifest must be declared in your <html> element as an attribute.

<pre>&lt;html manifest="nameofthemanifest.appcache"&gt;
...
&lt;/html&gt;</pre>

The _.appcache_ extension is actually not mandatory, but it&#8217;s the W3C standard, so you better adopt it in order to avoid incompatibilities with strict standard-observing browsers. The manifest attribute in a web application can specify either the relative path of a cache manifest file or an absolute URL (but they must be from the same origin as the application).

It&#8217;s important to know that this manifest must be <span style="text-decoration: underline;">included in each and every page that you want to be cached</span>, and you don&#8217;t have to list those pages in the manifest, because they will be automatically saved as the user visit them.

The cache manifest file must be served with the MIME type text/cache-manifest. In Apache, you can do that adding the following line to your .htaccess file:

<pre>AddType text/cache-manifest .appcache</pre>

## The Appcache manifest file

The Appcache manifest file is a simple text file that lists the resources (identified by URI) that you want the browser to cache for offline access. The following is an example of a manifest file:

<pre>CACHE MANIFEST
# mywebapp.appcache v1
# this is my cache manifest 
fileindex.html
cache.html
style.css
image1.png

# Use from network if available
NETWORK:
network.html

# Fallback content
FALLBACK:
/ fallback.html</pre>

It&#8217;s vital for the cache manifest to be identified as such to have **CACHE MANIFEST** as its first line. All the resources listed after that line are going to be cached.
  
The **NETWORK** section lists all the resources for which a network coverage is required, and you don&#8217;t want the browser to save them and use the cached version.
  
In the **FALLBACK** section we&#8217;re going to list the pages that should be showed when a certain resource is not available. In our case, we decided to show &#8220;_fallback.html_&#8221; for every resource not available (&#8220;_/_&#8220;).

You can also add a further section **CACHE**, which will work just as the lines after CACHE MANIFEST. All the three sections CACHE, NETWORK and FALLBACK are optional and can be declared more than once in the manifest file.

## Testing!

If you think that this is going to work at the first attempt you&#8217;re probably crazy. The smallest error in the appcache manifest file will actually prevent your application to be locally cached on a device. In such situations, tools like **Manifesto** (<a title="Manifesto" href="http://manifesto.ericdelabar.com/" target="_blank">http://manifesto.ericdelabar.com/</a>) are simply priceless and save you a lot of time and headaches.

<del>Firefox and a few other browsers display a <strong>notification bar</strong> the first time a user loads an application that uses the application cache.</del> [**UPDATE:**  Since v. 26, there is no longer a notification bar on Firefox when websites use _appcache_]

## See also

  * A beginner&#8217;s Guide to Using the Application Cache from HTML5Rocks: <a href="http://www.html5rocks.com/en/tutorials/appcache/beginner/" target="_blank">http://www.html5rocks.com/en/tutorials/appcache/beginner/</a>
  * Check browser compatibilities on HTML5Test: <a href="http://html5test.com/compare/feature/offline-applicationCache.html" target="_blank">http://html5test.com/compare/feature/offline-applicationCache.html</a>