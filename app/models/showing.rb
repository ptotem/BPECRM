class Showing < ActiveRecord::Base
  attr_accessible :flat_id, :showtime, :tour_id, :comment, :feedback, :tag_list
  belongs_to :tour
  belongs_to :flat

  #validates_presence_of :flat_id, :showtime

  acts_as_taggable

  rails_admin do
    navigation_label 'Tour Planning'
    weight 2
  end

end
