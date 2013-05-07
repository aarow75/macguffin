class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :cover
      t.string :author
      t.string :series
      t.string :year
      t.string :illustrator
      t.string :rating
      t.string :average_rating
      t.string :goodreads_review_count

      t.timestamps
    end
  end
end
