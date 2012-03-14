# SixArm.com » Ruby » <br> Class#defining and #redefining metaprogramming methods

* Docs: <http://sixarm.com/sixarm_ruby_defining/doc>
* Repo: <http://github.com/sixarm/sixarm_ruby_defining>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Meta-programming method that you call when you are defining
a class method, to detect if your class may be accidentally
overriding an existing method.

For docs go to <http://sixarm.com/sixarm_ruby_defining/doc>

Want to help? We're happy to get pull requests.



## Quickstart

Install:

    gem install sixarm_ruby_defining

Bundler:

    gem "sixarm_ruby_defining", "=1.0.6"

Require:

    require "sixarm_ruby_defining"


## Example

    class MyClass

      # raise an error if 'foo' is already a method
      defining 'foo'

      # raise an error if 'to_s' is NOT already a method
      redefining 'to_s'

      # you can check many names at once
      defining 'foo', 'goo', 'hoo', 
      redefining 'to_s', 'equal?', 'clone'

    end


