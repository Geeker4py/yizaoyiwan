class Category < ActiveRecord::Base
  alias_attribute :to_s, :name
  
  validates :name, :slug, :range, presence: true
  validates :name, :slug, uniqueness: true

  has_many :discussions
end
