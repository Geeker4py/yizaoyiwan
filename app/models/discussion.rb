class Discussion < ActiveRecord::Base
  extend Enumerize

  validates_presence_of :title, :content, :category_id, :parser
  enumerize :parser, in: [:markdown, :html], default: :html

  belongs_to :user
  belongs_to :category
  has_many :comments
end
