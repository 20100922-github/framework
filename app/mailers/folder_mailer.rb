class FolderMailer < ActionMailer::Base
  ##
  ## your service address here:
  ##
  default :from => "20100922-github@schleinkofer.name"

  def notify_new_folder(folder,user)
    @folder = folder
    @url = folder_url(folder, :host => "localhost:3000")

    mail(:to => user.email, :subject => "new folder")
  end
end
