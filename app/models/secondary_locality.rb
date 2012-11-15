class SecondaryLocality < ActiveRecord::Base
  attr_accessible :building_id, :secondary_locality_id
  belongs_to :building
  belongs_to :other_locality, :class_name => "Locality", :foreign_key => "secondary_locality_id"

  delegate :name, :to=>:other_locality

  rails_admin do
    visible false
    object_label_method do
      :custom_label_method
    end
  end

  def custom_label_method
    "#{self.name}"
  end

end
