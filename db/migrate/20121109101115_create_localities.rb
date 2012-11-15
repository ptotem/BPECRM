class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.integer :area_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
