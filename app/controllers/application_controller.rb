class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :tags
  def tags
    @tags = Audio.tag_counts_on(:tags)
  end

  before_filter :menus
  def menus
    @menu = Menu.all
  end

  before_filter :feeds
  def feeds
    feed_urls =  Rss.all.map(&:url)
    @feed = Feedzirra::Feed.fetch_and_parse(feed_urls)
  end

  protected
    def ckeditor_filebrowser_scope(options = {})
      super({ :assetable_id => current_user.id, :assetable_type => 'User' }.merge(options))
    end
end
