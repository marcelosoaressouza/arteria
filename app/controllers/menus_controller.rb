class MenusController < ApplicationController
  protect_from_forgery

  before_filter :authenticate_user! # !, :only => [:new, :edit, :create, :update, :destroy]

  before_filter :role_verify
  def role_verify
    redirect_to '/', notice: 'You dont have permission.' if ! current_user.has_role? :admin
  end

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menus = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    @menus = Menu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1/edit
  def edit
    @menus = Menu.find(params[:id])
  end

  # POST /menus
  # POST /menus.json
  def create
    @menus = Menu.new(params[:menu])

    respond_to do |format|
      if @menus.save
        format.html { redirect_to @menus, notice: 'Menu was successfully created.' }
        format.json { render json: @menus, status: :created, location: @menus }
      else
        format.html { render action: "new" }
        format.json { render json: @menus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    @menus = Menu.find(params[:id])

    respond_to do |format|
      if @menus.update_attributes(params[:menu])
        format.html { redirect_to @menus, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menus = Menu.find(params[:id])
    @menus.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end
end
