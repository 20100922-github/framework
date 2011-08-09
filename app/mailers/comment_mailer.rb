class CommentMailer < ActionMailer::Base
  ##
  ## your service address here:
  ##
  default :from => "20100922-github@schleinkofer.name"

  def notify_new_comment(comment,user)
    @comment = comment
    @url = comment_url(comment, :host => "localhost:3000")

    mail(:to => user.email, :subject => "new comment")
  end
end
