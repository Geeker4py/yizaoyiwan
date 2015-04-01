class AddLastCommentToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :last_comment_user_id, :integer
    add_column :discussions, :last_comment_at, :datetime
  end
end
