---
title: How to set up a full web server on a Raspberry PI
author: Marco Troisi
layout: post
date: 2013-01-16
url: /how-to-web-server-on-raspberry-pi/
categories:
  - Raspberry PI
  - Tutorials
tags:
  - apache
  - lampp
  - mysql
  - php
  - raspberry pi

---
In this post I am going to show you how to set up a fully operative **web server** on [Raspberry PI][1]. More specifically, this a LAMP server, which means Linux+Apache+MySQL+PHP, which the most common combination you find in most of the servers worldwide.

<!--more-->

## Refresh all your packages

Just before we start, it is indicated to _refresh all your repositories_, in order to get the most updated version of every software we are going to install. To do that, simply type the following command:

<pre class="lang:sh decode:true " >sudo apt-get update</pre>

## Apache web server

<pre class="">sudo apt-get install apache2</pre>

Doing this, you have installed now the <a title="Apache" href="http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CDQQFjAA&url=http%3A%2F%2Fhttpd.apache.org%2F&ei=HTH3UJ7EFqrx4QSohoGABg&usg=AFQjCNGyImC8Qi-rx_Bxd9knbUGKMxH5TQ&sig2=HrOuBOkg6T4w_1_LlDW4cw&bvm=bv.41018144,d.bGE" target="_blank">Apache</a> web server on your Raspberry PI.

## MySQL

To install <a title="MySQL" href="http://www.mysql.com" target="_blank">MySQL</a>, the Oracle-developed world&#8217;s most famous <a href="http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CDQQFjAA&url=http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FRelational_database_management_system&ei=2TD3UNzMFu314QSPo4GYBg&usg=AFQjCNF1cHWqW6UJUS3UPBCQCzEG_mHyWQ&sig2=gWQZ0HLHKXEvipfHBL1Cjw&bvm=bv.41018144,d.bGE" target="_blank">RDBMS</a>:

<pre>sudo apt-get install mysql-server</pre>

## PHP5

In order to be able to view your <a title="PHP" href="http://www.php.net" target="_blank">PHP</a> made websites, you will have to install PHP5, typing:

<pre>sudo apt-get install php5</pre>

<pre>sudo apt-get install php5-mysql</pre>

The second line will install the libraries that make PHP5 able to connect to the MySQL database.

## Ready to go!

Your web server is now ready and working, and you can test it by visiting (from a browser) **_http://localhost/_**. You can place all your websites&#8217; folders and files at the following path: **_/var/www/html/_**.

## Working with MySQL

As you will most probably need to work with one or more database, you may want to use a web interface for that. <a title="Adminer" href="http://www.adminer.org" target="_blank">Adminer</a> is a great, lightweight and very fast database management tool. To use it, simply type the following commands:

<pre class="lang:sh decode:true " >cd /var/www
mkdir adminer
cd adminer
sudo wget http://www.adminer.org/latest-mysql-en.php
mv latest-mysql-en.php index.php</pre>

Now, if you try to visit **_http://localhost/adminer_** from a browser, you should see your database management interface. To access it, simply insert the MySQL username and password you chose while installing it.

<del>In alternative, if you don&#8217;t like Adminer&#8217;s very simple interface and you want a much more graphical and powerful UI, you should give a try to <a title="Chive" href="http://www.chive-project.com" target="_blank">Chive</a>, a wonderful database management tool developed with the <a title="Yii framework" href="http://www.yiiframework.com" target="_blank">Yii framework</a>! Install it by typing:</del>

<pre class=""><del>cd /var/www
wget -O - http://www.chive-project.com/Download/Redirect|tar -xzp</del></pre>

<del>Visiting <strong><em>http://localhost/chive</em></strong> you will be able to work with Chive.</del>

**Update:** **Chive** does not appear to have been updated recently. It is therefore no longer a recommended choice.

## Conclusion

That&#8217;s all you need to be fully operative with a webserver running on your Raspberry PI. With very few or no changes, the above guide will also help you to install a LAMP web server on Ubuntu and Debian operating systems.

## See also

  * [Raspberry Pi User Guide][2] <img src="http://ir-na.amazon-adsystem.com/e/ir?t=marctroi-20&#038;l=as2&#038;o=1&#038;a=1118921666" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />by Eben Upton (creator of the Raspberry PI)
  * Buy a [Raspberry Pi 2 Model B Project Board &#8211; 1GB RAM &#8211; 900 MHz Quad-Core CPU][3]<img src="http://ir-na.amazon-adsystem.com/e/ir?t=marctroi-20&#038;l=as2&#038;o=1&#038;a=B00T2U7R7I" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

&nbsp;

 [1]: http://www.marcotroisi.com/2013/01/i-got-a-rasperry-pi/ "I got a Rasperry PI!"
 [2]: http://www.amazon.com/gp/product/1118921666/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1118921666&linkCode=as2&tag=marctroi-20&linkId=TQVYISKDEHET47YV
 [3]: http://www.amazon.com/gp/product/B00T2U7R7I/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B00T2U7R7I&linkCode=as2&tag=marctroi-20&linkId=36F2PY7IV6I63X5X