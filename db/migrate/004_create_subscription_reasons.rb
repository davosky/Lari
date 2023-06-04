class CreateSubscriptionReasons < ActiveRecord::Migration[7.0]
  def change
    create_table :subscription_reasons do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
