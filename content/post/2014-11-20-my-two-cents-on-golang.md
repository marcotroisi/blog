---
title: My Two Cents on Go
description: 'Coming from PHP, my impressions on Golang and a quick script in both languages to test productivity and performance.'
author: Marco Troisi
layout: post
date: 2014-11-20
url: /my-two-cents-on-golang/
dsq_thread_id:
  - 3245735799
categories:
  - Golang
  - PHP
  - Software Development
tags:
  - benchmark
  - go
  - golang
  - php

---
I have been recently studying and trying [Go][1] (Golang), a statically typed language developed by Google, which promises really fast execution times and a pleasant development experience.

I must say, it is pleasant to use indeed. And quite simple to learn. But it does also demolish some of the things that, coming from other languages, you might be giving for granted. While trying to get my head around it, it felt a lot like when I was trying to learn proper Javascript (i.e. _beyond_ jQuery), that is, it can sometimes take a while to understand, but then at one point something &#8216;clicks&#8217;, and immediately everything becomes so clear and easy. You do not end up necessarily thinking that it is _the best language ever_, but you do come to appreciate its design choices. <!--more-->

And it is easy to use, no doubt about that.

Just for the sake of fun, I was inspired by [this article][2] by Thiago Avelino to try doing the same benchmark comparison between PHP and Go.

Not only does it feel so easy and natural to &#8216;_port_&#8216; code from PHP to Go, but the difference in terms of execution times is quite remarkable (granted, this is a very simple test, and I do not need to tell you that you should not base your choice of a programming language on it).

So, the following is the script in PHP:

    <?php
    function fact($n){
        if($n===0)return 1;
        return $n*fact($n-1);
    }

    function calc(){
        $t = 0;
        for($i=0; $i<100000; $i++){
            for($j=0; $j<8; $j++){
                $t += fact($j);
            }
        }
        return $t;
    }

    $result = calc();
    echo $result."\n";


and this is the result of the benchmark:

    time php factorial.php
    591400000

    real    0m0.658s
    user    0m0.488s
    sys 0m0.004s


The following, instead, is the Go code:

    package main

    import "fmt"

    func main() {

        result := calc()
        fmt.Println(result)
    }

    func fact(n int) int {
        if n == 0 {
            return 1
        }

        return n * fact(n-1)
    }

    func calc() int {
        t := 0
        for i := 0; i < 100000; i++ {
            for j := 0; j < 8; j++ {
                t += fact(j)
            }
        }

        return t
    }


and here is the benchmark result:

    time go run factorial.go
    591400000

    real    0m0.156s
    user    0m0.138s
    sys 0m0.021s


Go is remarkably faster, while being frankly pretty easy to write. I have come to appreciate this language more and more, and I would wholeheartedly suggest to any PHP/Ruby/Python developer to add this nice, simple and fast language to his own skills. Learning more programming languages always ultimately make you a better developer.

 [1]: http://www.golang.org
 [2]: http://avelino.xxx/2014/03/golang-c-and-python-the-benchmark-time
