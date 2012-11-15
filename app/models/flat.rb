class Flat < ActiveRecord::Base
  attr_accessible :building_id, :carpet_area, :floor, :interiors_quality_id, :key, :name, :view_quality_id, :bhk_config_id, :flatype, :approved, :displayed, :minimum_rent, :expected_rent, :available_from, :flat_contacts_attributes, :flat_photos_attributes
  attr_accessible :tag_list, :floorplan
  belongs_to :building
  belongs_to :bhk_config
  belongs_to :interiors_quality, :class_name => "Quality", :foreign_key => "interiors_quality_id"
  belongs_to :view_quality, :class_name => "Quality", :foreign_key => "view_quality_id"

  has_many :showings, :dependent => :destroy

  has_many :flat_contacts, :dependent => :destroy
  accepts_nested_attributes_for :flat_contacts, :reject_if => proc { |attrs| reject = %w(contact_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  has_many :flat_photos, :dependent => :destroy
  accepts_nested_attributes_for :flat_photos, :allow_destroy => true

  has_attached_file :floorplan, :styles => {:medium => "100x100>"}

  #validates_presence_of :name
  #validates_presence_of :building_id, :message => "can't be empty or incorrect"
  #validates :name, :uniqueness => {:scope => :building_id}

  acts_as_taggable
  after_create :set_key

  rails_admin do
    weight 4
    navigation_label 'Property Database'
    configure :floorplan, :jcrop

    object_label_method do
      :custom_label_method
    end

    list do
      field :building
      field :name
      field :bhk_config
      field :expected_rent
      field :available_from
      field :displayed
      field :approved
    end
    edit do
      field :approved
      field :displayed
      field :building
      field :name
      field :bhk_config
      field :interiors_quality
      field :view_quality
      field :flatype, :enum do
        enum do
          ['Direct', 'Broker']
        end
      end
      field :floor
      field :carpet_area
      field :expected_rent
      field :minimum_rent
      field :available_from
      field :flat_contacts
      field :tag_list
      field :flat_photos
      field :floorplan do
        jcrop_options aspectRatio: 5.6/3.4
      end
    end
  end

  def custom_label_method
    "#{self.key}: #{self.name}, #{self.building.name unless self.building.blank?}"
  end

  def set_key
    self.key="B#{("%03d" % self.building.id).reverse}#{self.building.locality.name[0..1].upcase}#{("%04d" % self.id).reverse}"
    self.save
  end

end
