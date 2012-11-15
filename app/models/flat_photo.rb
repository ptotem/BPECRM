class FlatPhoto < ActiveRecord::Base
  attr_accessible :flat_id, :sequence, :showcase, :avatar
  belongs_to :flat
  has_attached_file :avatar

  rails_admin do
    weight 5
    navigation_label 'Property Database'
  end

end
