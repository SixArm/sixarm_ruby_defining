# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_defining'

describe Class do

  class C

    def m1
    end
    
    def m2
    end
    
    def m3
    end

  end

  describe ".defining" do

    it "with one new method => success" do
      C.defining("m4").must_equal true
    end

    it "with many new methods => success" do
      C.defining("m4", "m5", "m6").must_equal true
    end

    it "with one existing method => failure" do
      assert_raises RuntimeError do
        C.defining("m1")
      end
    end

    it "with some existing methods => failure" do
      assert_raises RuntimeError do
        C.defining("m1", "m2", "m3")
      end
    end

    it "with some new methods and existing methods => failure" do
      assert_raises RuntimeError do
        C.defining("m4", "m5", "m6", "m1", "m2", "m3")
      end
    end

  end

  describe ".defining_success" do
    
    it "will always return true" do
      C.defining_success("foo").must_equal true
    end

  end

  describe ".defining_failure" do
    
    it "will always raise an error" do
      assert_raises RuntimeError do
        C.defining_failure("foo")
      end
    end

  end
    
  describe ".redefining" do

    it "with one existing method => success" do
      C.redefining("m1").must_equal true
    end

    it "with many existing methods => success" do
      C.redefining("m1", "m2", "m3").must_equal true
    end

    it "with one new method => failure" do
      assert_raises RuntimeError do
        C.redefining("m4")
      end
    end

    it "with some new methods => failure" do
      assert_raises RuntimeError do
        C.redefining("m4", "m5", "m6")
      end
    end

    it "with some existing methods and new methods => failure" do
      assert_raises RuntimeError do
        C.redefining("m1", "m2", "m3", "m4", "m5", "m6")
      end
    end

  end

  describe ".redefining_success" do
    
    it "will always return true" do
      C.redefining_success("foo").must_equal true
    end

  end

  describe ".redefining_failure" do
    
    it "will always raise an error" do
      assert_raises RuntimeError do
        C.redefining_failure("foo")
      end
    end

  end
  
end

