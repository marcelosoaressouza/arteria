class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :tags
  def tags
    @tags = Post.tag_counts_on(:tags)
    @tags += Audio.tag_counts_on(:tags)
    @tags += Video.tag_counts_on(:tags)
    @tags += Image.tag_counts_on(:tags)
    @tags = @tags.uniq
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

  before_filter :about
  def about
    @about =  Post.find(1)
  end

  def owner_verify(model, url)
    if (current_user.id != model.user_id && (!current_user.has_role? :admin))
      redirect_to url, :alert => I18n.t('Permission Denied. You\'re not the owner')
      return false
    end

    return true
  end

  protected
    def ckeditor_filebrowser_scope(options = {})
      super({ :assetable_id => current_user.id, :assetable_type => 'User' }.merge(options))
    end
end
