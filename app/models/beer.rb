class Beer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :ratings, dependent: :destroy
end