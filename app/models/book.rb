class Book < ActiveRecord::Base
  #default_scope order("year desc, title asc")
  scope :best, lambda { where("review_count >= 100 AND average_rating > 3.5").order("review_count desc, average_rating desc") }
  scope :over_four_hundred, lambda { where("page_count > 400").order("page_count desc")}
  scope :two_to_four_hundred, lambda { where("page_count between 199 AND 401").order("page_count desc")}
  scope :under_two_hundred, lambda { where("page_count < 200").order("page_count desc")}
  scope :not_enough_reviews, lambda { where("review_count < 100").order("average_rating desc")}
  
  attr_accessible :author, :cover, :average_rating, :review_count, :illustrator, :rating, :series, :title, :year, :tag_list, :page_count, :notes
  
  acts_as_taggable
  
  validates :title, :presence => true
  
  FILTERS = [
    {:scope => "all", :label => "All"},
    {:scope => "best", :label => "Best"},
    {:scope => "not_enough_reviews", :label => "Not Enough Reviews (check goodreads and update)"},
    {:scope => "over_four_hundred", :label => "Over 400 pages"},
    {:scope => "two_to_four_hundred", :label => "200 to 400 pages"},
    {:scope => "under_two_hundred", :label => "Under 200 pages"}
  ]
end
