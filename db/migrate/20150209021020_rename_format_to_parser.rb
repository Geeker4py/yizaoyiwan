class RenameFormatToParser < ActiveRecord::Migration
  def change
    rename_column :discussions, :format, :parser
  end
end
