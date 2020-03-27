class AddSequenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sequence, :integer
  end
end
