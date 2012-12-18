class HomeController < ApplicationController
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

  def search
    @posts = Post.search do
      keywords params[:query]
      order_by :created_at, :desc
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
    end
  end
end
