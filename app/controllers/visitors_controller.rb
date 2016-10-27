class VisitorsController < ApplicationController

  def index
    if user_signed_in?
      if (Time.now - 20..Time.now).cover?(current_user.created_at)
        redirect_to '/3etapes'
      elsif current_user.sign_in_count <= 1 && (Time.now - 20..Time.now).cover?(current_user.updated_at) && current_user.orgns.count < 1
        redirect_to '/3etapes'
      else
      end
    end
  end

  def firstconnection
    if user_signed_in?
      @orgn = Orgn.new(user_id: current_user.id)
    end
  end

end
