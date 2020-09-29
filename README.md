# RedirectMySSL

A modern SSL redirector service with automatic SSL Certificate provisioning

## Problem

Let's say that you have a domain that you want to redirect to another domain. Your DNS service offers a DNS level redirect service
that will take care of that for you. All fine and good. But the DNS redirector will not handle SSL (http->https requests). Oops! 
In this day and age everthing is encrypted, and redirecting http->http may not be a great solution.

Another common scenario is that you have a client with an apex domain (say example.com) at a registrar that does not offer `ANAME` records. 
In today's cloud based deployment environments, apex domains will often have to be pointed as an alias to a cloud endpoint (which traditional `A` records will not let you do).

The choice is to either move your client to a registrar that supports `ANAME` records, or redirect apex to , say, www.example.com and CNAME the www subdomain to the cloud endpoint.

## Solution!

A DNS redirector service is much easier and much more cost effective than maintaining a tiny VPS to use for apex->subdomain redirects or any other redirect that you do not want to fiddle with nginx or apache to create.

RedirectMySSL aims to make creating redirects like this as easy as logging into a control panel and pressing a few buttons.
