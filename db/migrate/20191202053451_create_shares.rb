class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :declaration
      t.timestamps
    end
  end
end
