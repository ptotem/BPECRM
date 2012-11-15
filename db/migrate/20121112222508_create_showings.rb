class CreateShowings < ActiveRecord::Migration
  def change
    create_table :showings do |t|
      t.integer :tour_id
      t.integer :flat_id
      t.time :showtime
      t.text :comment
      t.text :feedback

      t.timestamps
    end
  end
end
