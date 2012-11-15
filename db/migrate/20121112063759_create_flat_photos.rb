class CreateFlatPhotos < ActiveRecord::Migration
  def change
    create_table :flat_photos do |t|
      t.integer :flat_id
      t.boolean :showcase
      t.integer :sequence

      t.timestamps
    end
  end
end
