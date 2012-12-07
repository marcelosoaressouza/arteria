class AddAttachmentAudioToAudios < ActiveRecord::Migration
  def self.up
    change_table :audios do |t|
      t.has_attached_file :audio
    end
  end

  def self.down
    drop_attached_file :audios, :audio
  end
end
