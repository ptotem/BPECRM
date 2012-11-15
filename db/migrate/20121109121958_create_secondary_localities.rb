class CreateSecondaryLocalities < ActiveRecord::Migration
  def change
    create_table :secondary_localities do |t|
      t.integer :building_id
      t.integer :secondary_locality_id

      t.timestamps
    end
  end
end
