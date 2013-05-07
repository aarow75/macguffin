class RatingsFormatFix < ActiveRecord::Migration
  def up
    change_column :books, :review_count, :integer
    change_column :books, :rating, :integer
    change_column :books, :average_rating, :decimal
  end

  def down
  end
end
