class AddPrivacyToSubscriber < ActiveRecord::Migration[7.0]
  def change
    add_reference :subscribers, :privacy_first, null: true, foreign_key: true
    add_reference :subscribers, :privacy_second, null: true, foreign_key: true
    add_reference :subscribers, :privacy_third, null: true, foreign_key: true
  end
end
