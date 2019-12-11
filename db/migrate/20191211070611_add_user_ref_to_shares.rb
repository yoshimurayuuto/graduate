class AddUserRefToShares < ActiveRecord::Migration[5.2]
  def change
    add_reference :shares, :user, foreign_key: true
  end
end
