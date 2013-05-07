class Rating < ActiveRecord::Base
  belongs_to :movie
  attr_accessible :rater, :rating
end
