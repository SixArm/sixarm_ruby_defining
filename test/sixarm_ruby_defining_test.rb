# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_defining'

class Testing < Test::Unit::TestCase

 def test_defining_one_should_be_success
  assert_nothing_raised do
   eval "class C 
      defining 'nonexistant'
    end"
  end
 end

 def test_defining_many_should_be_success
  assert_nothing_raised do
   eval "class C 
      defining 'nonexistant', 'nonexistant2', 'nonexistant3'
    end"
  end
 end

 def test_defining_one_should_be_failure
  assert_raise RuntimeError do
   eval "class C
     defining 'to_s'
    end"
  end
 end


 def test_defining_many_should_be_failure
  assert_raise RuntimeError do
   eval "class C
     defining 'to_s', 'clone', 'equal?'
    end"
  end
 end

 def test_redefining_one_should_be_success
  assert_nothing_raised do
   eval "class C 
      redefining 'to_s'
    end"
  end
 end

 def test_redefining_many_should_be_success
  assert_nothing_raised do
   eval "class C 
      redefining 'to_s', 'clone', 'equal?'
    end"
  end
 end

 def test_redefining_one_should_be_failure
  assert_raise RuntimeError do
   eval "class C
     redefining 'nonexistant'
    end"
  end
 end

 def test_redefining_many_should_be_failure
  assert_raise RuntimeError do
   eval "class C
     redefining 'nonexistant1', 'nonexistant2', 'nonexistant3'
    end"
  end
 end

end

