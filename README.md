# SixArm.com → Ruby → <br> Class#defining and #redefining metaprogramming methods

* Doc: <http://sixarm.com/sixarm_ruby_defining/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_defining>
* Repo: <http://github.com/sixarm/sixarm_ruby_defining>
<!--header-shut-->


## Introduction

Meta-programming method that we call when we are defining (or redefining) a class method, to detect if we're accidentally overriding an existing method.

  * Suppose we're creating a class defining a method named "foo".
  * Before we do it, we want to check to see if the method "foo" already exists, so we don't accidentally override it.
  * We call #defining which asks if the method "foo" already exists then gives us feedback if we can proceed safely.
  * We call #redefining if we know the method already exists and we are overriding it/

Example of defining a new method:

    class C
      defining "foo" 
      #=> return true; it's safe to proceed because #foo is not defined.

Example of error detection:

    class C
      defining "hash"
      #=> raise an error; it's not safe to proceed because #hash is already defined.

Example of intentionally overriding an existing method:

    class C
      redefining "hash"  
      #=> return true; it's safe to proceed because #hash is already defined.

Example of error detection:

    class C
      redefining "foo"  
      #=> raise an error; it's not safe to proceed because #foo is not yet defined.


For docs go to <http://sixarm.com/sixarm_ruby_defining/doc>

Want to help? We're happy to get pull requests.



<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_defining

Or add this to your Gemfile:

    gem 'sixarm_ruby_defining'

### Require

To require the gem in your code:

    require 'sixarm_ruby_defining'

<!--install-shut-->


## Multiple method names

The methods can take multiple names.

Example of #defining multiple names:

    class C
      defining "foo", "goo", "hoo"
      #=> return true if we're safe i.e. all the methods are not yet defined,
      #=> otherwise raise an error for each method that is already defined.


Example of #redefining multiple names:

    class C
      redefining "hash", "inspect", "equal?"
      #=> return true if all the methods are already defined,
      #=> otherwise raise an error for each method that is not yet defined.


## Intermixing

We can intermix the methods however we like:

    class C
      ...
      defining "foo", "goo"
      ...
      redefining "hash", "inspect"
      ...
      defining "goo"
      ...
      redefining "equals?"
   

## Customization for success and failure

For meta-programming we can customize what happens when #defining and #redefining encounter methods that are

  * defining_success: called by #defining when a method name is not yet defined; this will return true.

  * defining_failure: called by #defining when a method name is already defined; tihs will raise an error.

  * redefining_success: called by #redefining when a method name is already defined; this will return true.

  * redefining_failure: called by #redefining when a method name is not yet defined; tihs will raise an error.

   
