class AudiosController < ApplicationController
  layout nil, :only => :view

  protect_from_forgery
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

  before_filter :tags

  def tags
    @tags = Audio.tag_counts_on(:tags)
  end

  # GET /audios
  # GET /audios.json
  def index
    @audios = Audio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audios }
    end
  end

  # GET /audios/list
  # GET /audios/list.json
  def list
    @audios = Audio.all

    respond_to do |format|
      format.html
      format.json { render json: @audios }
    end
  end

  # GET /audios/1
  # GET /audios/1.json
  def show
    @audio = Audio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @audio }
    end
  end

  # GET /audios/view/1
  def view
    @audio = Audio.find(params[:id])
    render :layout => false
  end

  # GET /audios/new
  # GET /audios/new.json
  def new
    @audio = Audio.new
    @licenses = License.all
    @galleries = Gallery.all

    if @licenses.empty?
      redirect_to "/licenses/new", :notice => "You need to create at least one license"
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @audio }
    end
  end

  # GET /audios/1/edit
  def edit
    @licenses = License.all
    @galleries = Gallery.all

    @audio = Audio.find(params[:id])
  end

  # POST /audios
  # POST /audios.json
  def create
    @audio = Audio.new(params[:audio])
    @licenses = License.all
    @galleries = Gallery.all

    respond_to do |format|
      if @audio.save
        format.html { redirect_to @audio, notice: 'Audio was successfully created.' }
        format.json { render json: @audio, status: :created, location: @audio }
      else
        format.html { render action: "new" }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /audios/1
  # PUT /audios/1.json
  def update
    @audio = Audio.find(params[:id])
    @licenses = License.all
    @galleries = Gallery.all

    respond_to do |format|
      if @audio.update_attributes(params[:audio])
        format.html { redirect_to @audio, notice: 'Audio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audios/1
  # DELETE /audios/1.json
  def destroy
    @audio = Audio.find(params[:id])
    @audio.destroy

    respond_to do |format|
      format.html { redirect_to audios_url }
      format.json { head :no_content }
    end
  end

  def search
    @audios = Audio.search do
      keywords params[:query]
      order_by :created_at, :desc
    end.results

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @audios }
      format.json { render :json => @audios }
    end
  end
end
