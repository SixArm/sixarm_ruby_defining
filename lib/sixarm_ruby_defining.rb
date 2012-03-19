# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end


class Class

  # To protect our code, we call #defining before we define a new method.
  #
  # ==Example
  #
  #     class C
  #       defining :foo
  #       def foo
  #         ...
  #       end
  #     end
  #
  # The #defining method asks if the method #foo is safe for us to define:
  #
  #   * If #foo is not yet defined, then return true, i.e. we're safe.
  #   * If #foo is already definied, then raise an error.
  #
  # This is helpful for meta-programming because it lets us know
  # that we're not overriding a method that already exists.
  #
  # We can call this on many methods at once:
  #
  #    class C
  #       defining :foo, :goo, :hoo
  #       ...
  #    end
  #
  # The #defining method asks if each method is safe for us to define:
  #
  #   * If each method is not yet definied, then return true.
  #   * If a method is already definied, then raise an error.
  #
  # @return true iff we're safe (i.e. all the methods are not yet definied), or false otherwise.
  #
  # See #defining_success
  # See #defining_failure
  # Cf. #redefining

  def defining(*method_names)
    aok = true
    [*method_names].each{|m| 
      aok &= !method_defined?(m) \
      ? defining_success(m) \
      : defining_failure(m)
    }
    return aok
  end


  # Called when #defining sees that you are creating a new method.
  #
  # This method is a default and always returns true.
  # you can override it if you want to provide features 
  # like logging, coverage analysis, reporting, etc.
  #
  # @return iff we're safe then true, otherwise false
  #
  # See #defining
  # See #defining_failure

  def defining_success(method_name)
    return true
  end


  # Called when #defining sees that you are creating a method that already exists.
  #
  # This method raises an error with a diagnostic message.
  # You can override it if you want to provide features 
  # like logging, coverage analysis, reporting, etc.
  #
  # If you override this and do not choose to raise an error,
  # be sure to return true if we're safe, or false otherwise.
  #
  # See #defining
  # See #defining_success

  def defining_failure(method_name)
    raise "Class#defining expects '#{method_name}' to be a new method, but it already exists: #{self}##{method_name}"
  end


  # To protect our code, we call #redefining before we redefine a new method.
  #
  # ==Example
  #
  #     class C
  #       defining :hash
  #       def hash
  #         ...
  #       end
  #     end
  #
  # The #redefining method asks if the method #hash already exists:
  #
  #   * If #hash is already defined, then return true, i.e. we're safe.
  #   * If #hash is not yet defined, then raise an error.
  #
  # This is helpful for meta-programming because it lets us know
  # that we're intentially overriding a method that already exists.
  #
  # We can call this on many methods at once:
  #
  #    class C
  #       redefining :hash, :inspect, "equals?"
  #       ...
  #    end
  #
  # The #redefining method asks if each method is safe for us to define:
  #
  #   * If each method is already definied, then return true.
  #   * If a method is not yet definied, then raise an error.
  #
  # @return true iff we're safe (i.e. all the methods are already definied), or false otherwise.
  #
  # See #redefining_success
  # See #redefining_failure
  # Cf. #defining

  def redefining(*method_names)
    aok = true
    [*method_names].each{|m|
      aok &= method_defined?(m) \
      ? redefining_success(m)
      : redefining_failure(m)
    }
    return aok
  end


  # Called when #redefining sees that you are overriding an existing method.
  #
  # This method is a default and always returns true.
  # You can override it if you want to provide features 
  # like logging, coverage analysis, reporting, etc.
  #
  # @return true iff we're safe, or false otherwise.
  #
  # See #redefining
  # See #redefining_failure

  def redefining_success(method_name)
    true
  end


  # Called when #redefining sees that you are creating a method that doesn't exist.
  #
  # This method raises an error with a diagnostic message.
  # You can override it if you want to provide features 
  # like logging, coverage analysis, reporting, etc.
  #
  # If you override this and do not choose to raise an error,
  # be sure to return true if we're safe, or false otherwise.
  #
  # See #redefining
  # See #redefining_success

  def redefining_failure(method_name)
    raise "Class#redefining expects '#{method_name}' to be overriding an existing method, but it doesn't exist"
  end


end
