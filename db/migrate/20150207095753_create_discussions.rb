class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :category_id
      t.string :format

      t.timestamps
    end
  end
end
