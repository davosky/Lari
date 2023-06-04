class AddAmountToSubscriber < ActiveRecord::Migration[7.0]
  def change
    add_column :subscribers, :amount, :decimal, precision: 8, scale: 2, default: 0.00
  end
end
