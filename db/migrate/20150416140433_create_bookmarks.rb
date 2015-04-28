class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user_id, index: true
      t.belongs_to :discussion_id, index: true

      t.timestamps
    end
  end
end
