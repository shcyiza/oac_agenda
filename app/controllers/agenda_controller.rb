class AgendaController < ApplicationController
before_action :authenticate_user!
respond_to :html, :js
  def index
    if current_user.pro == true
      @events = Event.all.order("esdate DESC")

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
    params.require(:event).permit(:orgn_id, :enom, :edesc, :esdate, :eedate, :pafpre, :pafplace, :pays, :ville, :codepostal, :rue, :nrrue)
  end

end
