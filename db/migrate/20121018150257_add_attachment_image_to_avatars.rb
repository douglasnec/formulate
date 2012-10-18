class AddAttachmentImageToAvatars < ActiveRecord::Migration
  def self.up
    rename_column :avatars, :type, :flag
  end

  def self.down
    drop_attached_file :avatars, :image
  end
end
