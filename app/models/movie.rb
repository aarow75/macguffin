class Movie < ActiveRecord::Base
  scope :modern, lambda { where("year >= 1969").order("year desc") }
  scope :golden_age, lambda { where("year < 1969").order("year desc") }
  scope :alphabetical, lambda { order("title asc") }
  scope :freshest, lambda { where("freshness > 60").order("freshness desc") }
  scope :best_imdb, lambda { where("imdb > 7.0").order("imdb desc") }
  scope :favorites, lambda { where("rating >= 4").order("rating desc, freshness desc, imdb desc")}
  scope :not_rated, lambda { where("rating = ''").order("year desc") }
  scope :no_tags, joins('LEFT JOIN taggings ON taggings.taggable_id = movies.id AND taggings.taggable_type = "Movie"').where('taggings.id IS NULL')
  
  attr_accessible :series, :rating, :cover, :director, :freshness, :imdb, 
  				  :lead_actor, :notes, :screenwriter, :title, :year, :tag_list
  
  has_many :ratings, :dependent => :destroy

  acts_as_taggable
  
  validates :title, :presence => true
  
  FILTERS = [
    {:scope => "all", :label => "All"},
    {:scope => "modern", :label => "Modern"},
    {:scope => "golden_age", :label => "Golden Age"},
    {:scope => "alphabetical", :label => "Alphabetical"},
    {:scope => "freshest", :label => "Freshest"},
    {:scope => "best_imdb", :label => "Best IMDB"},
    {:scope => "favorites", :label => "Favorites"},
    {:scope => "no_tags", :label => "No Tags"},
    {:scope => "not_rated", :label => "Not Rated"}
  ]
  
  def average_user_rating
    # takes the average user rating AND my rating and averages them.
    # if there are no user ratings it shows just my rating.
    if self.ratings.count > 0
      sum = 0;
      self.ratings.each do |r|
        sum += r.rating
      end
      sum += self.rating.to_i
      sum / (self.ratings.count + 1)
      
    else
      self.rating.to_i
    end
  end
  
  def aggregate_rating
  	fields_to_average = 0
  	# get personal rating
  	if self.rating === (nil || "")
  		self.rating = 0
  	else
  		fields_to_average += 1
  	end
  	
  	# get rotten tomatoes rating
  	if self.freshness === (nil || "")
  		self.freshness = 0
  	else
  		fields_to_average += 1
  	end
  	
  	# get imdb rating
  	if self.imdb === (nil || "")
  		self.imdb = 0
  	else
  		fields_to_average += 1
  	end
  	
  	((self.freshness.to_i + (self.imdb.to_f * 10) + (self.rating.to_i * 20) ) / fields_to_average).to_d.round(1)
  end
  
end
