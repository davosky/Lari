class Operator < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :subscribers
  has_many :landlords
end
