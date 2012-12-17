class VideosController < ApplicationController
  layout nil, :only => :view

  protect_from_forgery
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  before_filter :tags

  def tags
    @tags = Video.tag_counts_on(:tags)
  end

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end

  # GET /videos/list
  # GET /videos/list.json
  def list
    @videos = Video.all

    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/view/1
  def view
    @video = Video.find(params[:id])
    render :layout => false
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new
    @licenses = License.all
    @galleries = Gallery.all

    if @licenses.empty?
      redirect_to "/licenses/new", :notice => "You need to create at least one license"
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @licenses = License.all
    @galleries = Gallery.all

    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video])
    @licenses = License.all
    @galleries = Gallery.all

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])
    @licenses = License.all
    @galleries = Gallery.all

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  def search
    @videos = Video.search do
      keywords params[:query]
      order_by :created_at, :desc
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @videos }
      format.json { render :json => @videos }
    end
  end
end
