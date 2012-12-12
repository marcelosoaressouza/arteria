class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' }

  validates_attachment_size :data, :less_than => 8.megabytes
  validates_attachment_presence :data
	
  def url_content
    url(:content)
  end
end
