# AxiomRTC

Axiom Real Time Online Classing

## Overview

Online learning center for education.

## Getting started

Make sure Ruby is installed.

    $ ruby -v

Install requirements:

    $ bundle
    
Setup database:

    $ rails db:migrate && rails db:setup
    
Fire up the server:

    $ rails s
    
Now you can visit `http://localhost:3000`

## Localize

Support both Chinese and English, change following line in `config/application.rb`

~~~ruby
    I18n.default_locale = :en
~~~
    
to 

~~~ruby
    I18n.default_locale = :cn
~~~
    
to enable Chinese version.

It's better to add localization parsing in routing.

## Characters

* Administrators
* Teachers
* Students

## Chatting

* n to n: n students + n teachers + n administrator

You can add strangers into the chatting if you want.

## TODOs

* Integrate character management
* Use dynamic key generation other than static APP ID on Chatting
* Enable schedule on chatting
* Enable recording on chatting
* Enable guardian (of students) and administrator spot checking on chatting
* Use Redis for chatting cache
* Enable mobile phone number ownership checking
* Billing

## By

Xing(thehxpax@gmail.com)