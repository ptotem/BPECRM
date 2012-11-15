class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :building_id
      t.integer :bhk_config_id
      t.string :name
      t.integer :interiors_quality_id
      t.integer :view_quality_id
      t.integer :carpet_area
      t.string :floor
      t.string :key
      t.string :flatype
      t.boolean :approved
      t.boolean :displayed
      t.integer :expected_rent
      t.date :available_from

      t.timestamps
    end
  end
end
