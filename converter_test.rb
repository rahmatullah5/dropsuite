#!/usr/bin/env ruby
require 'test/unit'
require_relative './converter'

class ConverterTest < Test::Unit::TestCase
  def test_call_function
    assert_equal 'abcdef 4', Converter.new('DropsuiteTest').call, "function should return 'abcdef 4'"
    assert_equal 'abcdef 4', Converter.new(%q{dropsuitetest/}).call, "function should return 'abcdef 4'"
  end

  def test_with_white_spaced_parameter
    assert_equal 'abcdef 4', Converter.new('       DropsuiteTest     ').call, "function should return 'abcdef 4'"
  end

  def test_with_downcased_parameter
    assert_equal 'abcdef 4', Converter.new('DropsuiteTest'.downcase).call, "function should return 'abcdef 4'"
  end

  def test_with_uppercased_parameter
    assert_equal 'abcdef 4', Converter.new('DropsuiteTest'.upcase).call, "function should return 'abcdef 4'"
  end

  def test_with_sub_directories_parameter
    assert_equal 'abcdef 1', Converter.new('DropsuiteTest/A').call, "function should return 'abcdef 1'"
    assert_equal 'abcdef 2', Converter.new('DropsuiteTest/B').call, "function should return 'abcdef 2'"
    assert_equal 'abcdefghijkl 1', Converter.new('DropsuiteTest/B/D').call, "function should return 'abcdefghijkl 1'"
  end

  def test_with_empty_folder
    # assert_equal 'There is no file detected', Converter.new('DropsuiteTest/C').call, "function should return validation message"
  end

  def test_with_fictitious_folder
    assert_equal 'Folder destination does not exist', Converter.new('DropsuiteTest$!@3').call, "function should return validation message"
  end

  def test_with_unsupported_folder_name
    assert_equal 'Folder destination contain unsupported character', Converter.new('DropsuiteTest$!@3!@#$%^&*()_+<>').call, "function should return validation message"
  end
end