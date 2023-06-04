class CreatePrivacyThirds < ActiveRecord::Migration[7.0]
  def change
    create_table :privacy_thirds do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
