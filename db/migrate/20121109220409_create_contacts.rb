class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :facebook
      t.string :linkedin
      t.text :notes

      t.timestamps
    end
  end
end
