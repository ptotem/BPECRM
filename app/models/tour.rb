class Tour < ActiveRecord::Base
  attr_accessible :contact_id, :comments, :employee_id, :feedback, :tour_date, :coordinator_id, :showings_attributes
  belongs_to :contact
  belongs_to :employee, :class_name => "Contact", :foreign_key => "employee_id"
  belongs_to :coordinator, :class_name => "Contact", :foreign_key => "coordinator_id"
  has_many :showings, :dependent => :destroy
  accepts_nested_attributes_for :showings, :reject_if => proc { |attrs| reject = %w(flat_id time).all? { |a| attrs[a].blank? } }, :allow_destroy => true


  rails_admin do
    navigation_label 'Tour Planning'
    weight 1
    edit do
      field :contact
      field :employee
      field :coordinator
      field :tour_date
      field :comments
      field :showings
      field :feedback
    end
  end

end
