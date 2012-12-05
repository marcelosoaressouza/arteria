class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => "/attachments/:id/:filename",
                    :path => ":rails_root/public/attachments/:id/:filename"
  
  validates_attachment_size :data, :less_than => 64.megabytes
  validates_attachment_presence :data
	
	def url_thumb
	  @url_thumb ||= Ckeditor::Utils.filethumb(filename)
	end
end
