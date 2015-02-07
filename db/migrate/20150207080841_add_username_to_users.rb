class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, uniq: true
  end
end
