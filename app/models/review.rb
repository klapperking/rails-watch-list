class Review < ApplicationRecord
  ALLOWED_RATINGS = (1..5)

  belongs_to :list

  validates :comment, presence: true, length: { minimum: 5 }
  validates :rating, presence: true, numericality: { only_integer: true, in: ALLOWED_RATINGS }
end
