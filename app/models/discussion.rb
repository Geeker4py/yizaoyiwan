class Discussion < ActiveRecord::Base
  validates_presence_of :title, :content, :category_id, :format
end
