class FixPageCount < ActiveRecord::Migration
  def up
    change_column :books, :page_count, :integer
  end

  def down
  end
end
