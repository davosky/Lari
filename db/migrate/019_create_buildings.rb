class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :code
      t.string :address
      t.string :house_number
      t.string :zip
      t.string :city
      t.string :province
      t.references :landlord, null: false, foreign_key: true
      t.references :building_type, null: true, foreign_key: true

      t.timestamps
    end
  end
end
