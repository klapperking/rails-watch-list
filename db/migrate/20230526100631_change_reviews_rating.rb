class ChangeReviewsRating < ActiveRecord::Migration[7.0]
  def change
    reversible do |direction|
      change_table :reviews do |t|
        direction.up   { t.change :rating, :integer }
        direction.down { t.change :price, :decimal }
      end
    end
  end
end
