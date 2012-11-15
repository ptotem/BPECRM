class BhkConfig < ActiveRecord::Base
  attr_accessible :name
  has_many :flats, :dependent => :destroy
  rails_admin do
    visible false
  end
end
