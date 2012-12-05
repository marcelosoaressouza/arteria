class HomeController < ApplicationController
  def index
  end

  def tagged
    if params[:tag].present?
      @posts  = Post.tagged_with(params[:tag]).sort_by(&:id).reverse
    else
      @posts = Post.all
    end
  end
end
