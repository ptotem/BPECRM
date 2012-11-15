class Contact < ActiveRecord::Base
  attr_accessible :email, :facebook, :linkedin, :name, :notes, :phone, :connections_attributes, :flat_contacts_attributes
  attr_accessible :tag_list

  has_many :connections, :dependent => :destroy
  accepts_nested_attributes_for :connections, :reject_if => lambda { |a| !Connection.find_by_other_id_and_relationship_and_contact_id(a[:other_id], a[:relationship], a[:contact_id]).nil? or a[:other_id].blank? or a[:relationship].blank? }, :allow_destroy => true
  has_many :flat_contacts, :dependent => :destroy
  accepts_nested_attributes_for :flat_contacts, :reject_if => proc { |attrs| reject = %w(flat_id contact_id).all? { |a| attrs[a].blank? } }, :allow_destroy => true


  validates_presence_of :name
  acts_as_taggable

  rails_admin do
    navigation_label 'Contact Database'
    weight 1

    list do
      field :name
      field :phone
      field :email
    end
    edit do
      field :name
      field :phone
      field :email
      field :tag_list
      field :facebook
      field :linkedin
      field :notes
      field :flat_contacts
      field :connections
    end
  end
  
end
