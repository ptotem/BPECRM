class Quality < ActiveRecord::Base
  attr_accessible :name, :value
  has_many :buildings
  has_many :flats

  rails_admin do
    visible false
    list do
      field :name
      field :value
    end
    edit do
      field :name
      field :value
    end
  end
end
