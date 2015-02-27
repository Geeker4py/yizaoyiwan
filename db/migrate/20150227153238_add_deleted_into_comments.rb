class AddDeletedIntoComments < ActiveRecord::Migration
  def change
    add_column :comments, :deleted_at, :datetime
    add_column :comments, :deleted_by, :integer
  end
end
