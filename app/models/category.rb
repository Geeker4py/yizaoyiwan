class Category < ActiveRecord::Base
  validates :name, :slug, :range, presence: true
  validates :name, :slug, uniqueness: true
end
