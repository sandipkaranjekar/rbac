# RBAC (Role Based Access Control)
[![Gem Version](https://badge.fury.io/rb/rbac.svg)](https://badge.fury.io/rb/rbac)

RBAC (Role Based Access Control) gem useful to enable your Rails application with the power of RBAC.
This gem is helpful to maintain roles, groups and privileges at database table level. You have user interface to manage the roles, groups and privileges.This gem is applicable in the area where you need a multiple roles and privileges. It will fulfil all your needs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rbac'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rbac
    
As this gem is database based access control system, so need to run:

    $ rails g rbac:migration

after this -

    $ rake db:migrate

To setup user interface and backend for RBAC you need to run following generator. It will create necessary controllers, views, models, routes, helper method and associations.

*Note - Before this your Rails application have User model*

	$ rails g rbac:create

## Pre-requisites
This gem work with User model only. Generator of this gem add association for User model. In further development we will integrate this with any authentication gem.

## Concept
In this there is strong relationship between user, role, group and privilege. 
* User and Role model have many-to-many association
	User can have multiple roles and Role can have multiple users associated. It's as per your requirements, for this you need to associate roles with user in your add/update users controller/view.
	
	For example -
	
  	![alt text](https://raw.githubusercontent.com/sandipkaranjekar/rbac/master/images/user_form.png "User new/edit form")
  
* Role and Group model have many-to-many association
	Here group is set of privileges group together while creating role, user need to assign groups to the role. So automatically privileges associated with this group get assigned to role (indirectly to user).
  You can access Role and Group UI -
  * http://{host_url}/rbac/roles
  * http://{host_url}/rbac/groups
  
* Group and Privilege model have many-to-many association
  Here Group can have multiple privileges and privilege belongs to many groups. You need to first set privileges with controller and action. If you select privilege under group it will be accessable to role.
  All privileges are controller and action based.You should have controller and action to set privilege.
  You can access Privilege UI -
  * http://{host_url}/rbac/privileges

## Usage
Here you will have one helper method to check role have access to that resource.
```ruby
has_permission(user, controller, action)
```
user = Logged in user active record object
controller = For which controller that resource belong
action = Action of controller which we need to check for having permission

This method return *true* and *false*. Accordingly you can make a decision.

For example - 
```ruby
# In view
<% if has_permission(user, "users", "show") %>
  <%= link_to 'Show', user %>
<% end %>
```
## TODO
* Support API application means has_permission should work with api permission granting.
* Integrate with authentication gem.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

