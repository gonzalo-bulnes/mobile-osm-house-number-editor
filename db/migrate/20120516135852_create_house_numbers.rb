class CreateHouseNumbers < ActiveRecord::Migration
  def change
    create_table :house_numbers do |t|
      t.integer :changeset
      t.float :latitude
      t.float :longitude
      t.string :value

      t.timestamps
    end
  end
end
