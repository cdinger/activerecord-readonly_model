require "active_record-readonly_model/version"

module ActiveRecord
  module ReadonlyModel
    @@bypass_flag = true

    def self.bypass(&block)
      @@bypass_flag = true
      yield
      @@bypass_flag = false
    end

    # Prevents objects from being created
    def readonly?
      super && !@@bypass_flag
    end

    def self.included(base)
      base.class_eval do
        def readonly
          true
        end
        before_save { raise ActiveRecord::ReadOnlyRecord unless @@bypass_flag }
        before_destroy { raise ActiveRecord::ReadOnlyRecord unless @@bypass_flag }
      end
    end
  end
end
