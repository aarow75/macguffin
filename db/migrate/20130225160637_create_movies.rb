class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :cover
      t.boolean :digital_copy
      t.string :director
      t.string :format
      t.string :freshness
      t.string :imdb
      t.string :lead_actor
      t.text :notes
      t.string :production_designer
      t.string :screenwriter
      t.string :title
      t.string :year

      t.timestamps
    end
  end
end
