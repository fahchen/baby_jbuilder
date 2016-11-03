require 'bundler/setup'
require 'active_support'
require 'active_support/test_case'
require 'minitest/autorun'
require 'pry'

ActiveSupport::TestCase.test_order = :random
