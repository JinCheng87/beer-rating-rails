class Rating < ApplicationRecord
  validates :stars, presence: true
  validates :comment, presence: true
  belongs_to :beer
end