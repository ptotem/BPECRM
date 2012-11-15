class FlatContact < ActiveRecord::Base
  attr_accessible :contact_id, :flat_id, :relationship

  belongs_to :flat
  belongs_to :contact

  validates_presence_of :relationship

  rails_admin do
    visible false
    object_label_method do
      :custom_label_method
    end
    edit do
      field :flat
      field :contact
      field :relationship, :enum do
        enum do
          ['Landlord', 'Tenant', 'Broker', 'Employee', 'Prospect', 'Other']
        end
      end
    end
  end

  def custom_label_method
      "#{self.contact.name}: #{self.relationship} for #{self.flat.key}"
  end

end
