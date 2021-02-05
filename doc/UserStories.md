# User Stories

## Basic UI

As a public user

* As a public user, I can see an overview of services that are offered
* As a public user, I can register an account with my email address and password (devise registerable)
* As a public user, I can see a nice page to register with

As a subscriber

* P1 As a subscriber, I can view a list of my redirects
* P1 As a subscriber, I can view the details of each redirect
* P1 As a subscriber, I can CRUD my redirects


As an Admin

* As an admin, I can manage and modify a list of users
* As an admin, I can see a general overview of each user


As the authorization system

* As the auth system, I can grant/deny access to the subscribers account
* As the auth system, I can show subscriber-specific data
* As the auth system, I can grant/deny acess to the admin area
 

## Backend Operations

As the system

* As the system, I can manage a set of cloud servers
* As the system, I can generate a config out of the aggregation of all users redirects
* As the system, I can split up configurations to be balanced among available cloud servers
* As the system, I can provision a new cloud server and keep track of how many redirects that it serves
* As the system, I can rebalance the configuration files among n number of servers, keeping existing redirects on the same server
* As the system, I can alert people when a new cloud server is provisioned.
* As the system, I can track, load, reload, and stop running caddy server processes


## Enhanced UI (next milestone) (User story needs more.... Story.)

As a public user

* As a public user, I can subscribe with github and other 3rd party auth services

As a subscriber

* As a subscriber, I can see metrics about my redirects
* As a subscriber, I can file a support ticket in regards to an item in the system
* As a subscriber, I can pay for unlimited services

As an API user

* As the API, I can list my redirects
* As the API I can crud my redirects
* As the API I can retrieve metrics about my redirects

As an admin

* As an admin, I can get a list of the most active redirects
* As an admin, I can manage spam/abuse
* As an admin, I can run reports and visualize the most active users/redirects