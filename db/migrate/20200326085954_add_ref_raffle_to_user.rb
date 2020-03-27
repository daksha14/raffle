class AddRefRaffleToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :raffle,foreign_key: true
  end
end
