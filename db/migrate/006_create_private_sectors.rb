class CreatePrivateSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :private_sectors do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
