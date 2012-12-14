class HomeController < ApplicationController
  before_filter :tags

  def tags
    @tags = Post.tag_counts_on(:tags)
  end

  def index
    @posts = Post.all
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  def tagged
    if params[:tag].present?
      @contents  = Post.tagged_with(params[:tag]).sort_by(&:id).reverse
      @contents += Audio.tagged_with(params[:tag]).sort_by(&:id).reverse
      @contents += Video.tagged_with(params[:tag]).sort_by(&:id).reverse
      @contents += Image.tagged_with(params[:tag]).sort_by(&:id).reverse
    else
      @contents  = Post.all
      @contents += Audio.all
      @contents += Video.all
      @contents += Image.all
    end
  end
end
