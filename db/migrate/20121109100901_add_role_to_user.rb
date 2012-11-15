class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :datacenter, :boolean
  end
end
