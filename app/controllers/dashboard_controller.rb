class DashboardController < ApplicationController
  def index
    if user_signed_in?
      @folders = Folder.where("created_at > ?", current_user.last_sign_in_at)
      @comments = Comment.where("created_at > ?", current_user.last_sign_in_at)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folders }
    end
  end

end
