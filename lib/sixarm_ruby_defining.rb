# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end


class Class

  # To protect your code, call this just before you define a new method.
  #
  # ==Example
  #   class MyClass
  #     defining :foo
  #     def foo
  #       "hello world"
  #     end
  #   end
  #
  # See #redefining

  def defining(*method_names)
    [*method_names].each{|m|
      !method_defined?(m) ? defining_success(m) : defining_failure(m)
    }
  end


  # Called when #defining sees that you are creating a new method.
  #
  # This method is blank; you can override it if you want to provide
  # features like logging, coverage analysis, reporting, etc.

  def defining_success(method_name)
  end


  # Called when #defining sees that you are creating a method that already exists.
  #
  # This method raises an error with a diagnostic message.

  def defining_failure(method_name)
    raise "Class#defining expects '#{method_name}' to be a new method, but it already exists: #{self}##{method_name}"
  end


  # To protect your code, call this just before you redefine an existing method.
  #
  # ==Example
  #   class MyClass
  #     redefining :to_s
  #     def to_s
  #       "hello world"
  #     end
  #   end
  #
  # See #redefining

  def redefining(*method_names)
    [*method_names].each{|m|
      method_defined?(m) ? redefining_success(m) : redefining_failure(m)
    }
  end


  # Called when #redefining sees that you are overriding an existing method.
  #
  # This method is blank; you can override it if you want to provide
  # features like logging, coverage analysis, reporting, etc.

  def redefining_success(method_name)
  end


  # Called when #redefining sees that you are creating a method that doesn't exist.
  #
  # This method raises an error with a diagnostic message.

  def redefining_failure(method_name)
    raise "Class#redefining expects '#{method_name}' to be overriding an existing method, but it doesn't exist"
  end


end
