class CreateDeliveryCards < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_cards do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
