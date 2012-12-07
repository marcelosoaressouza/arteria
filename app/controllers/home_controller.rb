class HomeController < ApplicationController
  def index

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
