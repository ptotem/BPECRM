class Connection < ActiveRecord::Base
  attr_accessible :contact_id, :other_id, :relationship

  belongs_to :contact, :class_name => "Contact", :foreign_key => "contact_id"
  belongs_to :other, :class_name => "Contact", :foreign_key => "other_id"

  after_create :create_inverse_connection

  rails_admin do
    visible false
    edit do
      field :other
      field :relationship
    end
  end

  def create_inverse_connection
    if Connection.find_by_other_id_and_contact_id_and_relationship(self.contact_id, self.other_id, self.relationship).nil?
      Connection.create!(:other_id => self.contact_id, :contact_id => self.other_id, :relationship => self.relationship)
    end
  end

end
