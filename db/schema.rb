# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130318221352) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "cover"
    t.string   "author"
    t.string   "series"
    t.string   "year"
    t.string   "illustrator"
    t.integer  "rating",         :limit => 255
    t.decimal  "average_rating"
    t.integer  "review_count",   :limit => 255
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "page_count",     :limit => 255
    t.text     "notes"
  end

  create_table "movies", :force => true do |t|
    t.string   "cover"
    t.boolean  "digital_copy"
    t.string   "director"
    t.string   "freshness"
    t.string   "imdb"
    t.string   "lead_actor"
    t.text     "notes"
    t.string   "screenwriter"
    t.string   "title"
    t.string   "year"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "rating"
    t.string   "series"
    t.boolean  "bluray"
    t.boolean  "dvd"
    t.boolean  "ultraviolet"
    t.boolean  "apple"
  end

  create_table "ratings", :force => true do |t|
    t.string   "rater"
    t.integer  "rating"
    t.integer  "movie_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ratings", ["movie_id"], :name => "index_ratings_on_movie_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

end
