class HomeController < ApplicationController
  def index
    @posts = Post.all
    @images = Image.all
    @tags = Post.tag_counts_on(:tags)

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
      @contents += Image.all
      @contents += Video.all
    end
  end
end
