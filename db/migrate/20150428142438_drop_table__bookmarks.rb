class DropTableBookmarks < ActiveRecord::Migration
  def change
    drop_table :bookmarks
  end
end
