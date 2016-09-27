class AddAttachmentAvatarToOrgns < ActiveRecord::Migration
  def self.up
    change_table :orgns do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :orgns, :avatar
  end
end
