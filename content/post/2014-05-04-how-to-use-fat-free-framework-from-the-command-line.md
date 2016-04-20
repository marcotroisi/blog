---
title: How to use Fat Free framework from the command line
description: "A simple tutorial that will enable you to use Fat Free framework from command line in just a few minutes."
author: Marco Troisi
layout: post
date: 2014-05-04
url: /how-to-use-fat-free-framework-from-the-command-line/
dsq_thread_id:
  - 2659771718
categories:
  - Fat Free framework
  - PHP
  - Tutorials

---
## Introduction

Every good framework should allow you to easily create/execute commands from the [command line][1] (also called _shell_ or _terminal_).

The command line is incredibly helpful and in some cases (e.g. when executing _cron jobs_ or particularly big scripts that make extensive use of your server&#8217;s resources) simply unavoidable.<!--more-->

This tutorial will show you how to execute your scripts using the command line and work with a standard Fat Free application to illustrate them. It assumes then that you already have Fat Free framework installed and working on your server. If you don&#8217;t know how to do this, please refer to an [earlier tutorial][2] that I have written for [Digital Ocean][3].

Unfortunately, while executing commands from the command line with Fat Free framework is fairly easy, it is not very well documented and you might find yourself in trouble if you need to use that functionality.

## Set up your commands

To set up your command, create a new route in your application&#8217;s bootstrap page (if you have followed the &#8220;set up&#8221; [tutorial][2], then it should be `index.php`). To do that, just add a new routing directive:

    $f3->route('GET /command', function($f3) {
        echo "Here our command starts".PHP_EOL;
        // lots of operations here
        echo "Done! Be proud!";
    });


If you want to be sure that your command will only be executed through the command line, then the **[PHP_SAPI][4]** function will be a life-saver for you (this is function that returns the type of interface in use between PHP and the web server). For example:

    $f3->route('GET /command', function($f3) {
        if(php_sapi_name() == "cli") {
            //In cli-mode = the interface in use is the command line (cli)
            echo "Here our command starts".PHP_EOL;
            // lots of operations here
            echo "Done! Be proud!";
        } else {
            //Not in cli-mode
            echo "You're not allowed to execute this operation";
        }
    });


## Execute your command

And now comes the fun part. In order to execute the command that you have just set up, open a terminal application and write:

    cd /your/application/path // go to the directory where Fat Free is installed
    php index.php "/command" // execute your command


At this point, if there are no errors in your code, you should see the output of your command on screen.

You might of course sometimes need to save the output somewhere, so that you may check it at any time, especially if you execute your command as a cron job.

If that is the case, then write this:

    php index.php "/command" > /path/to/file.txt


## Troubleshooting

### Server variables

You might encounter issues with Web server-related functions and variables in your code (e.g. `$_SERVER['HTTP_HOST']`), which will inevitably return an error, since the command line won&#8217;t recognize them. Here is where the **[PHP_SAPI][4]** function could turn out to be extremely valuable, as it will allow you to detect whether your code is being executed by a web server or through the command line. This is what you might want to write to avoid this type of error:

    $http_host = (php_sapi_name() == "cli") ? "cli" : $_SERVER['HTTP_HOST'];
    echo $http_host;


instead of just:

    echo $_SERVER['HTTP_HOST']; // this will not work on the command line


### Paths

Also, the command line will not recognize relative paths within your PHP code. So, be sure to always use the absolute path when you, for instance, handle a file. A path that looks like `/files/log/log.txt` will then have to become something like `/var/www/html/thisismyapp.ie/files/log/log.txt`.

## Conclusion

As you have seen, using the command line with a framework like Fat Free is easy and does not imply changing a lot of things in your code. That means that you can easily call the same functions from both browser and command line, which makes your life easier (whereas with some other frameworks you have to put your commands in a different place, which means additional work).

 [1]: http://en.wikipedia.org/wiki/Command-line_interface "command line"
 [2]: https://www.digitalocean.com/community/articles/how-to-use-the-fat-free-php-framework
 [3]: http://www.digitalocean.com
 [4]: http://www.php.net/manual/en/reserved.constants.php
