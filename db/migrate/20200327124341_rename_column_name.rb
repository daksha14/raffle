class RenameColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :sequence, :chance_to_win
  end
end
