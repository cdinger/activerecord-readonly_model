require 'helper'

class TestReadonly < Test::Unit::TestCase
  should "have a version" do
    assert_not_nil(ActiveRecord::ReadonlyModel::VERSION)
  end
end
