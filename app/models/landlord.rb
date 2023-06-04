class Landlord < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["id", "company_name", "code", "first_name", "last_name", "fiscal_code", "address", "house_number", "zip", "city", "province", "phone", "mobile", "email", "landlord_type_id", "operator", "updater", "created_at", "updated_at", "operator_id", "fulloperatorname"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["operator", "sex", "landlord_type"]
  end

  has_many :buildings

  before_create :set_landlord_id, :set_landlord_code

  def set_landlord_id
    last_landlord_id = Landlord.maximum(:id)
    self.id = last_landlord_id.to_i + 1
  end

  def set_landlord_code
    last_landlord_id = Landlord.maximum(:id)
    self.code = "#{last_landlord_id.to_i + 1}-#{Date.today.to_s}"
  end

  belongs_to :landlord_type
  belongs_to :sex
  belongs_to :operator

  validates :landlord_type_id, presence: true
  validates :address, presence: true
  validates :house_number, presence: true
  validates :zip, presence: true
  validates :city, presence: true
  validates :province, presence: true
end
