class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :rating, numericality: { in: (0...10) , allow_nil: true }
end
