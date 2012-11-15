class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.integer :contact_id
      t.integer :employee_id
      t.integer :coordinator_id
      t.date :tour_date
      t.text :comments
      t.text :feedback

      t.timestamps
    end
  end
end
