class CreatePublicSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :public_sectors do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
