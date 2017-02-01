class MailsPreviewController < ApplicationController

  def welcome_and_confirmation
    if current_user.is_admin?
    #url: prevmail/1
      @user = User.find(5)
    else
      redirect_to :back
    end
  end

  def event_on_same_day
    #code
  end

end
