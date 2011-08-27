class DashboardController < ApplicationController
  def index
    @folders = Folder.accessible_by(current_ability).order("created_at DESC")
    @comments = Comment.accessible_by(current_ability).order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folders }
    end
  end

end
