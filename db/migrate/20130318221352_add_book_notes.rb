class AddBookNotes < ActiveRecord::Migration
  def up
    add_column :books, :notes, :text
  end

  def down
  end
end
