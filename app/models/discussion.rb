class Discussion < ActiveRecord::Base
  extend Enumerize

  validates_presence_of :title, :content, :category_id, :parser
  enumerize :parser, in: [:markdown, :html], default: :html
end
