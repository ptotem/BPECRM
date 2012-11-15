class Locality < ActiveRecord::Base
  attr_accessible :area_id, :description, :name
  belongs_to :area
  has_many :buildings, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :area_id, :message => "can't be empty or incorrect"

  rails_admin do
    weight 2
    navigation_label 'Property Database'

    list do
      field :name
      field :area
    end
    edit do
      field :name
      field :area
      field :description
    end
  end

end
