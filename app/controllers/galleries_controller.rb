class GalleriesController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.order('created_at DESC').page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/list
  # GET /galleries/list.json
  def list
    @galleries = Gallery.all

    respond_to do |format|
      format.html
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @gallery = Gallery.new
    @licenses = License.all

    if @licenses.empty?
      redirect_to "/licenses/new", :notice => "You need to create at least one license"
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @licenses = License.all
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(params[:gallery])
    @licenses = License.all

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])
    @licenses = License.all

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end

  def search
    @galleries = Gallery.search do
      keywords params[:query]
      order_by :created_at, :desc
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @galleries }
      format.json { render :json => @galleries }
    end
  end
end
