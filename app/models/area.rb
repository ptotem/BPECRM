class Area < ActiveRecord::Base
  attr_accessible :city_id, :name, :localities_attributes
  belongs_to :city
  has_many :localities, :dependent => :destroy
  accepts_nested_attributes_for :localities, :reject_if => proc { |attrs| reject = %w(name).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  validates_presence_of :name
  validates_presence_of :city_id, :message => "can't be empty or incorrect"

  rails_admin do
    weight 1
    navigation_label 'Property Database'
    list do
      field :name
    end
    edit do
      field :name
      field :city
      field :localities
    end
  end


end
