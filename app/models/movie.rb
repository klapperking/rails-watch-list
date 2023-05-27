class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :rating, numericality: { in: (0...10), allow_nil: true }

  def self.search(term)
    # TODO: Search Controller?
    # where(['title LIKE ?', "%#{term}%"])

    Movie.all.select { |movie| movie.title.include?(term) }
  end
end
