ubuntu1404_ruby
================

Shippable CI image for Ruby on Ubuntu 14.04. Available versions are:

1. 1.8.7
2. 1.9.2
3. 1.9.3
4. 2.0.0
5. 2.1.1
6. jruby
7. ruby-head

## How to use
You can use this image to run ruby builds on Shippable. Just update your
`shippable.yml` file and add the `build_image` directive. You should also
activate the appropriate rvm so your build runs against the
correct version of ruby. You can use `$SHIPPABLE_RUBY` environment variable to specify ruby versions. Here's a sample YML file to get you going:

````

language: ruby

build_image: shippableimages/ubuntu1404_ruby

rvm:
  - 2.1.1
  
before_install:
 - source ~/.rvm/scripts/rvm
 - rvm install $SHIPPABLE_RUBY --verify-downloads 1
 - source ~/.bashrc && ~/.rvm/scripts/rvm && rvm use $SHIPPABLE_RUBY
 
install:
 - bundle install --gemfile="Gemfile"
 - ruby -v

script:
- bundle exec rake

````
