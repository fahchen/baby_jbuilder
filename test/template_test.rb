require 'test_helper'
require 'baby_jbuilder/template'

class TemplateTest < ActiveSupport::TestCase
  test 'single key' do
    result = BabyJbuilder::Template.render do |json|
      json.content 'Hello'
    end

    assert_equal 'Hello', JSON.parse(result)['content']
  end

  test 'mulitple keys' do
    result = BabyJbuilder::Template.render do |json|
      json.name 'Phil'
      json.hi 'Hello'
    end

    parsed_result = JSON.parse(result)
    assert_equal 'Phil', parsed_result['name']
    assert_equal 'Hello', parsed_result['hi']
  end

  test 'sets block result as value' do
    result = BabyJbuilder::Template.render do |json|
      json.name { 'Phil' }
      json.hi do
        'Hello'
      end
    end

    parsed_result = JSON.parse(result)
    assert_equal 'Phil', parsed_result['name']
    assert_equal 'Hello', parsed_result['hi']
  end

  test 'sets nil value' do
    result = BabyJbuilder::Template.render do |json|
      json.name
    end

    parsed_result = JSON.parse(result)
    assert_nil parsed_result['name']
  end
end
