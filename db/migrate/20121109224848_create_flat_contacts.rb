class CreateFlatContacts < ActiveRecord::Migration
  def change
    create_table :flat_contacts do |t|
      t.integer :flat_id
      t.integer :contact_id
      t.string :relationship

      t.timestamps
    end
  end
end
