class CreatePrivacyFirsts < ActiveRecord::Migration[7.0]
  def change
    create_table :privacy_firsts do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
