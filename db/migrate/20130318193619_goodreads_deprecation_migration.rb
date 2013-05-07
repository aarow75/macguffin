class GoodreadsDeprecationMigration < ActiveRecord::Migration
  def up
    rename_column :books, :goodreads_rating, :average_rating
    rename_column :books, :goodreads_review_count, :review_count
    add_column :books, :page_count, :string
  end

  def down
    rename_column :books, :average_rating, :goodreads_rating 
    rename_column :books, :review_count, :goodreads_review_count 
    remove_column :books, :page_count
  end
end
