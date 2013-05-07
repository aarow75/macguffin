class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :rater
      t.integer :rating
      t.references :movie

      t.timestamps
    end
    add_index :ratings, :movie_id
  end
end
