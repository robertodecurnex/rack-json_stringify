# rack-jsonp-middleware 
[![Gem Version](https://badge.fury.io/rb/rack-json_stringify.png)](http://badge.fury.io/rb/rack-json_stringify)[![Travis CI Status](https://travis-ci.org/robertodecurnex/rack-json_stringify.png)](https://travis-ci.org/robertodecurnex/rack-json_stringify) [![Gemnasium Dependencies Status](https://gemnasium.com/robertodecurnex/rack-json_stringify.png)](https://gemnasium.com/robertodecurnex/rack-json_stringify) [![Code Climate](https://codeclimate.com/github/robertodecurnex/rack-json_stringify.png)](https://codeclimate.com/github/robertodecurnex/rack-json_stringify) [![Coverage Status](https://coveralls.io/repos/robertodecurnex/rack-json_stringify/badge.png?branch=master)](https://coveralls.io/r/robertodecurnex/rack-json_stringify)

takes any JSON response and format all the values (but null) to string whenever the proper header value is set.

## Overview

## Authors

Roberto Decurnex (decurnex.roberto@gmail.com)

## Contributors

## Install

If you are using Bundler you can easily add the following line to your Gemfile:
    
    gem 'rack-json_stringify'

Or you can just install it as a ruby gem by running:
    
    $ gem install rack-json_stringify

## Configuration

### Rails 3

In your `config/application.rb` file add:
    
    require 'rack/json_stringify'

And, within the config block:
    
    config.middleware.use Rack::JsonStringify

### Rails 2

Same as for Rails 3 but modifying the `config/environment.rb` file instead.

### Rack Apps

In your `config.ru` file add the following lines:
    
    require 'rack/json_stringify'
    use Rack::JsonStringify

## Download

You can also clone the project with Git by running:
    $ git clone git://github.com/robertodecurnex/rack-json_stringify

## Examples

Given that http://domain.com/action.json returns:

    {"key":1}

Then http://domain.com/action.json with the X-ACCEPTED-TYPES=String will return:

    {"key":"1"}

