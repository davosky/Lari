class Subscriber < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["id", "code", "subscription_date", "first_name", "last_name", "birth_date", "birth_place", "fiscal_code", "nationality", "citizenship", "address", "house_number", "zip", "city", "province", "phone", "mobile", "email", "category_id", "delivery_card_id", "occupation_id", "private_sector_id", "public_sector_id", "subscription_reason_id", "subscription_type_id", "operator", "updater", "created_at", "updated_at", "operator_id", "fulloperatorname", "amount"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "delivery_card", "occupation", "operator", "private_sector", "public_sector", "sex", "subscription_reason", "subscription_type"]
  end

  before_create :set_subscriber_id, :set_subscriber_code, :set_subscription_date

  def set_subscriber_id
    last_subscriber_id = Subscriber.maximum(:id)
    self.id = last_subscriber_id.to_i + 1
  end

  def set_subscriber_code
    last_subscriber_id = Subscriber.maximum(:id)
    self.code = "#{last_subscriber_id.to_i + 1}-#{Date.today.to_s}"
  end

  def set_subscription_date
    self.subscription_date = Date.today
  end

  belongs_to :sex
  belongs_to :category, optional: true
  belongs_to :delivery_card
  belongs_to :occupation, optional: true
  belongs_to :private_sector, optional: true
  belongs_to :public_sector, optional: true
  belongs_to :subscription_reason
  belongs_to :subscription_type
  belongs_to :operator
  belongs_to :privacy_first, optional: true
  belongs_to :privacy_second, optional: true
  belongs_to :privacy_third, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :birth_place, presence: true
  validates :fiscal_code, presence: true
  validates :nationality, presence: true
  validates :citizenship, presence: true
  validates :address, presence: true
  validates :house_number, presence: true
  validates :zip, presence: true
  validates :city, presence: true
  validates :province, presence: true
end
