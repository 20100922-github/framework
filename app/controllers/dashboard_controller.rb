class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @folders = Folder.accessible_by(current_ability).limit(5).order("created_at DESC")
      @comments = Comment.accessible_by(current_ability).limit(5).order("created_at DESC")
      #@folders = Folder.where("created_at > ?", current_user.last_sign_in_at)
      #@comments = Comment.where("created_at > ?", current_user.last_sign_in_at)
    else
      @folders = Folder.accessible_by(current_ability).limit(5).order("created_at DESC")
      @comments = Comment.accessible_by(current_ability).limit(5).order("created_at DESC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folders }
    end
  end

end
