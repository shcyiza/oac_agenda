class AgendaController < ApplicationController
before_action :authenticate_user!
respond_to :html, :js
  def index
    @events = Event.all.order("esdate DESC")
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def show
  end

  def foldate_params
    params.require(:foldate).permit(:user_id, :datefolwd)
  end

end
