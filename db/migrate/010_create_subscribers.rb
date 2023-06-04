class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.date :subscription_date
      t.string :code
      t.string :fiscal_code
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :birth_place
      t.references :sex, null: false, foreign_key: true
      t.string :nationality
      t.string :citizenship
      t.string :address
      t.string :house_number
      t.string :zip
      t.string :city
      t.string :province
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :fulloperatorname
      t.string :updater
      t.references :category, null: true, foreign_key: true
      t.references :delivery_card, null: false, foreign_key: true
      t.references :occupation, null: true, foreign_key: true
      t.references :private_sector, null: true, foreign_key: true
      t.references :public_sector, null: true, foreign_key: true
      t.references :subscription_reason, null: false, foreign_key: true
      t.references :subscription_type, null: false, foreign_key: true
      t.references :operator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
