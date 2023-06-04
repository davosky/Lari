class CreateLandlords < ActiveRecord::Migration[7.0]
  def change
    create_table :landlords do |t|
      t.string :code
      t.string :company_name
      t.string :vat_number
      t.string :fiscal_code
      t.string :first_name
      t.string :last_name
      t.references :sex, null: false, foreign_key: true
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
      t.references :landlord_type, null: false, foreign_key: true
      t.references :operator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
