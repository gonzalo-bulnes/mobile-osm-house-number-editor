class AddUserIdToHouseNumbers < ActiveRecord::Migration
  def change
    add_column :house_numbers, :user_id, :integer

    add_index :house_numbers, [:user_id, :created_at]
  end
end
