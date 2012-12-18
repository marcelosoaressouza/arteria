class UsersController < ApplicationController
  protect_from_forgery

  before_filter :authenticate_user!

  before_filter :role_verify
  def role_verify
    redirect_to '/', notice: 'You dont have permission.' if ! current_user.has_role? :admin
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @roles = Role.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @roles = Role.all

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, :notice => 'Successfully created' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @roles = Role.all

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, :notice => 'Successfully updated' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, :notice => 'Successfully deleted' }

      format.json { head :no_content }
    end
  end
end