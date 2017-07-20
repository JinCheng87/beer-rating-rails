class Beer < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :ratings
end