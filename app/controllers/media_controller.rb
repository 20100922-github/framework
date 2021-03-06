class MediaController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def download_original
    @medium = Medium.find(params[:id])
    send_file @medium.file.path, :type => @medium.file_content_type, :disposition => 'inline'
  end

  def download_medium
    @medium = Medium.find(params[:id])
    send_file @medium.file.path(:medium), :type => @medium.file_content_type, :disposition => 'inline'
  end

  def download_thumb
    @medium = Medium.find(params[:id])
    send_file @medium.file.path(:thumb), :type => @medium.file_content_type, :disposition => 'inline'
  end

  def download_quadratic
    @medium = Medium.find(params[:id])
    send_file @medium.file.path(:quadratic), :type => @medium.file_content_type, :disposition => 'inline'
  end

  # GET /media
  # GET /media.xml
  def index
    @media = Medium.accessible_by(current_ability).paginate :page => params[:page], :order => "created_at DESC", :per_page => 10
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /media/1
  # GET /media/1.xml
  def show
    @medium = Medium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medium }
    end
  end

  # GET /media/new
  # GET /media/new.xml
  def new
    @medium = Medium.new
    @tags = Tag.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medium }
    end
  end

  # GET /media/1/edit
  def edit
    @medium = Medium.find(params[:id])
    @tags = Tag.all
  end

  # POST /media
  # POST /media.xml
  def create
    @medium = Medium.new(params[:medium])
    @medium.tags = Tag.find(params[:tag_ids]) if params[:tag_ids]

    respond_to do |format|
      if @medium.save
        format.html { redirect_to(@medium.folder, :notice => 'Medium was successfully created.') }
        format.xml  { render :xml => @medium.folder, :status => :created, :location => @medium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /media/1
  # PUT /media/1.xml
  def update
    @medium = Medium.find(params[:id])
    @medium.tags = Tag.find(params[:tag_ids]) if params[:tag_ids]

    respond_to do |format|
      if @medium.update_attributes(params[:medium])
        format.html { redirect_to(@medium, :notice => 'Medium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.xml
  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to(media_url) }
      format.xml  { head :ok }
    end
  end
end
