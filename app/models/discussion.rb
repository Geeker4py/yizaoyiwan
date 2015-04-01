class Discussion < ActiveRecord::Base
  extend Enumerize

  self.per_page = 5 # 初期测试用

  validates_presence_of :title, :content, :category_id, :parser
  enumerize :parser, in: [:markdown, :html], default: :html

  belongs_to :user
  belongs_to :category
  has_many :comments
  belongs_to :last_comment_user, class_name: 'User', foreign_key: :last_comment_user_id
end
