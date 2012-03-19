# SixArm.com » Ruby » <br> Class#defining and #redefining metaprogramming methods

* Docs: <http://sixarm.com/sixarm_ruby_defining/doc>
* Repo: <http://github.com/sixarm/sixarm_ruby_defining>
* Email: Joel Parker Henderson, <joel@sixarm.com>


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



## Quickstart

Install:

    gem install sixarm_ruby_defining

Bundler:

    gem "sixarm_ruby_defining", "=1.1.0"

Require:

    require "sixarm_ruby_defining"


## Install with high security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_defining --test --trust-policy HighSecurity


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

  * #defining_success: #defining calls this when a method name is not yet defined; this will return true.

  * #defining_failure: #defining calls this when a method name is already defined; tihs will raise an error.

  * #redefining_success: #redefining calls this when a method name is already defined; this will return true.

  * #redefining_failure: #redefining calls this when a method name is not yet defined; tihs will raise an error.

   
## Changes

* 2012-03-17 1.1.0 Upgrade for Ruby 1.9.3, minitest/spec, and improved docs.
* 2011-10-08 1.0.6 Updates for gem publishing


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2012 Joel Parker Henderson
