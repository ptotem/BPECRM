class AddMinimumRentToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :minimum_rent, :integer
  end
end
