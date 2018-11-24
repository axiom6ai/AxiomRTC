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

Fire up the server with https: 

    $ nohup rbenv sudo rails s puma -b 'ssl://0.0.0.0:443?key=id_rsa&cert=axiom6_ai.crt&verify_mode=none&ca=axiom6_ai.ca-bundle' & 
    
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

## Starting HTTPS Server 

Pre-compile javascript assets 

    $ RAILS_ENV=development bundle exec rake assets:precompile

Fire up the server:

    $ nohup rbenv sudo rails s puma -b 'ssl://0.0.0.0:443?key=id_rsa&cert=axiom6_ai.crt&verify_mode=none&ca=axiom6_ai.ca-bundle' &

## Characters

* Administrators
* Teachers
* Students

## Chatting

* n to n
 
n students + n teachers + n administrator

Where `n` is a limited number.

You can also add strangers into the chatting if you want.

## Accounts

In development environment, accounts are settled up in `db/seeds`.

Briefly:

* All passwords are '12345678'
* Administrtor mobiles: 10000000001, 20000000000...20000000005
* Teacher mobiles: 30000000000...30000000016
* Student mobiles: 40000000000...40000000140

Use them to sign in for testing.

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