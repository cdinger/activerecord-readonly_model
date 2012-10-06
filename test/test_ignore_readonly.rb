require 'helper'

class TestReadonly < Test::Unit::TestCase
  context "Some static model" do
    setup do
      ActiveRecord::Base.connection.create_table :static_things, :force => true do |t|
        t.string :name
      end
      ActiveRecord::Base.connection.execute("insert into static_things (name) values ('Blah thing')")
      class StaticThing < ActiveRecord::Base
        include ActiveRecord::ReadonlyModel
      end
    end

    teardown do
      ActiveRecord::Base.connection.drop_table :static_things
    end

    should "allow destroy in an ignore_readonly block" do
      before_count = StaticThing.count
      assert_nothing_raised do
        ActiveRecord::ReadonlyModel.bypass do
          thing = StaticThing.first
          assert(thing.destroy)
        end
      end
      assert_not_equal(before_count, StaticThing.count)
    end

    should "allow delete in an ignore_readonly block" do
      before_count = StaticThing.count
      assert_nothing_raised do
        #StaticThing.ignore_readonly { StaticThing.delete_all }
        ActiveRecord::ReadonlyModel.bypass { StaticThing.delete_all }
      end
      assert_not_equal(before_count, StaticThing.count)
    end

    should "allow update in an ignore_readonly block" do
      assert_nothing_raised do
        ActiveRecord::ReadonlyModel.bypass do
          thing = StaticThing.first
          thing.name = 'something different'
          assert(thing.save)
        end
      end
    end
  end
end
