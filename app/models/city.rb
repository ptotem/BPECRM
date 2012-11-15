class City < ActiveRecord::Base
  attr_accessible :name
  has_many :areas, :dependent => :destroy

  validates_presence_of :name

  rails_admin do
    visible false
    list do
      field :name
    end
    edit do
      field :name
    end
  end

end
