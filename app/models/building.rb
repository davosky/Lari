class Building < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["id", "code", "address", "house_number", "zip", "city", "province"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["building_type_id", "lordland_id"]
  end

  before_create :set_building_id, :set_building_code

  def set_building_id
    last_building_id = Building.maximum(:id)
    self.id = last_building_id.to_i + 1
  end

  def set_building_code
    last_building_id = Building.maximum(:id)
    self.code = "#{last_building_id.to_i + 1}-#{Date.today.to_s}"
  end

  belongs_to :building_type
  belongs_to :landlord

  validates :building_type_id, presence: true
  validates :landlord_id, presence: true
  validates :address, presence: true
  validates :house_number, presence: true
  validates :zip, presence: true
  validates :city, presence: true
  validates :province, presence: true
end
