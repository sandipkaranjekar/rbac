# Rbac

RBAC (Role Based Access Control) gem useful to enable your Rails application with the power of RBAC.
This gem is helpful to maintain roles, groups and privileges at database table level. You have user interface to manage the roles, groups and privileges.This gem is applicable in the area where you need a multiple roles and privileges. it will fulfeel all your needs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rbac'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rbac
    
As this gem is database based access control system, so need to run:

    $ rails g rbac:migration

after this -

    $ rake db:migrate

To setup user interface and backend for RBAC you need to run following generator. It will create necessary controllers, views, models and association.

*Note - Before this your Rails application have User model*

	$ rails g rbac:create

## Pre-requisites
This gem work with User model only. Generator of this gem add association for User model. In further development we will integrate this with any authentication gem.

## Concept
In this there is strong association between user, role, group and privilege. 
* User and Role model have many-to-many association
  

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rbac. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

