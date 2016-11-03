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

  test 'sets nil value' do
    result = BabyJbuilder::Template.render do |json|
      json.name
    end

    parsed_result = JSON.parse(result)
    assert_nil parsed_result['name']
  end

  test 'sets nesting value' do
    result = BabyJbuilder::Template.render do |json|
      json.name do
        json.first 'Phil'
      end
      json.address do
        json.contry do
          json.name 'China'
          json.province do
            json.name 'Sichuan'
            json.city do
              json.name 'Chengdu'
            end
          end
        end
      end
    end

    parsed_result = JSON.parse(result)
    assert_equal 'Phil', parsed_result['name']['first']
    assert_equal 'Chengdu', parsed_result['address']['contry']['province']['city']['name']
  end
end
