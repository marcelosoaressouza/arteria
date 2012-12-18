class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :tags
  def tags
    @tags = Audio.tag_counts_on(:tags)
  end

  before_filter :menu
  def menu
    @mainmenu = Menu.all
  end

  protected
    def ckeditor_filebrowser_scope(options = {})
      super({ :assetable_id => current_user.id, :assetable_type => 'User' }.merge(options))
    end
end
