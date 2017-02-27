class AgendaController < ApplicationController
before_action :authenticate_user!
respond_to :html, :js
  def index
    if current_user.pro == true
      @events = Event.where(deleted_at: nil).order("esdate")
    else
      redirect_to :back, :alert => "demande invalide"
    end
  end

  def show
  end

  def folevent_params
    params.require(:folevent).permit(:user_id, :event_id)
  end

  def foldate_params
    params.require(:foldate).permit(:user_id, :datefolwd)
  end

  def event_params
    params.require(:event).permit(:orgn_id, :enom, :edesc, :esdate, :esdate_date, :esdate_hour, :esdate_min, :eedate, :eedate_date, :eedate_hour, :eedate_min, :pafpre, :pafplace, :pays, :ville, :codepostal, :rue, :nrrue, :flyer)
  end

end
