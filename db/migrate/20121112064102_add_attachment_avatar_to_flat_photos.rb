class AddAttachmentAvatarToFlatPhotos < ActiveRecord::Migration
  def self.up
    change_table :flat_photos do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :flat_photos, :avatar
  end
end
