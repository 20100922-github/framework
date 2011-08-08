class FoldersController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def download_medium
    @folder = Folder.find(params[:id])
    send_file @folder.cover.path(:medium), :type => @folder.cover_content_type, :disposition => 'inline'
  end

  def download_quadratic
    @folder = Folder.find(params[:id])
    send_file @folder.cover.path(:quadratic), :type => @folder.cover_content_type, :disposition => 'inline'
  end

  def download_thumb
    @folder = Folder.find(params[:id])
    send_file @folder.cover.path(:thumb), :type => @folder.cover_content_type, :disposition => 'inline'
  end

  # GET /folders
  # GET /folders.xml
  def index
    @folders = Folder.accessible_by(current_ability).order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folders }
    end
  end

  # GET /folders/1
  # GET /folders/1.xml
  def show
    @folder = Folder.find(params[:id])
    @media = Medium.where("folder_id = ?", params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.xml
  def new
    @folder = Folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @folder }
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.xml
  def create
    @folder = Folder.new(params[:folder])

    respond_to do |format|
      if @folder.save
        @users = User.all
        @users.each do |u|
          FolderMailer.notify_new_folder(@folder,u).deliver
        end
        format.html { redirect_to(@folder, :notice => 'Folder was successfully created.') }
        format.xml  { render :xml => @folder, :status => :created, :location => @folder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @folder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /folders/1
  # PUT /folders/1.xml
  def update
    @folder = Folder.find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        format.html { redirect_to(@folder, :notice => 'Folder was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @folder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.xml
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to(folders_url) }
      format.xml  { head :ok }
    end
  end
end
