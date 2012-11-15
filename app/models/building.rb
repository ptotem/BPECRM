class Building < ActiveRecord::Base
  attr_accessible :address, :approach_quality_id, :building_quality_id, :description, :landmark, :latitude, :longitude, :moving_charge, :name, :pincode, :locality_id, :road, :year_built, :secondary_localities_attributes, :private_note, :flats_attributes
  attr_accessible :tag_list
  belongs_to :locality
  belongs_to :building_quality, :class_name => "Quality", :foreign_key => "building_quality_id"
  belongs_to :approach_quality, :class_name => "Quality", :foreign_key => "approach_quality_id"

  has_many :secondary_localities, :dependent => :destroy
  accepts_nested_attributes_for :secondary_localities, :reject_if => proc { |attrs| reject = %w(secondary_locality_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  has_many :flats, :dependent => :destroy
  accepts_nested_attributes_for :flats, :reject_if => proc { |attrs| reject = %w(name).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  acts_as_taggable

  validates_presence_of :name
  validates_presence_of :locality_id, :message => "can't be empty or incorrect"
  validates :name, :uniqueness => {:scope => :locality_id}

  rails_admin do
    weight 3
    navigation_label 'Property Database'

    list do
      field :name
      field :locality
      field :building_quality
      field :approach_quality
      field :tag_list
    end
    edit do
      field :name
      field :locality
      field :building_quality
      field :approach_quality
      field :address
      field :road
      field :pincode
      field :landmark
      field :latitude
      field :longitude
      field :description
      field :private_note
      field :moving_charge
      field :year_built, :enum do
        enum do
          (1980..Time.now.year).to_a
        end
      end
      field :secondary_localities
      field :tag_list
      field :flats
    end
  end
end
