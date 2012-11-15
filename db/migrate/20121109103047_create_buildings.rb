class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :locality_id
      t.integer :building_quality_id
      t.integer :approach_quality_id
      t.text :address
      t.string :road
      t.integer :pincode
      t.integer :year_built
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :landmark
      t.string :moving_charge
      t.text :private_note

      t.timestamps
    end
  end
end
