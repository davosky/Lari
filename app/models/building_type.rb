class BuildingType < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "position", "created_at", "updated_at"]
  end

  has_many :buildings

  validates :name, presence: true
  validates :position, presence: true
end
