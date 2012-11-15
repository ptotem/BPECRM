class AddAttachmentFloorplanToFlats < ActiveRecord::Migration
  def self.up
    change_table :flats do |t|
      t.has_attached_file :floorplan
    end
  end

  def self.down
    drop_attached_file :flats, :floorplan
  end
end
