module GroupValidates
  extend ActiveSupport::Concern

  attr_accessor :validates_group

  included do
    def group_validates(flag)
      self.validates_group = flag
    end

    def self.group_validates(flag, &block)
      with_options if: -> { validates_group == flag }, &block
    end
  end
end