class ActivitiesController < ApplicationController

  def index
    @activities = Activity.order("created_at desc")
  end

  def folevent_params
    params.require(:activity).permit(:action, :trackable)
  end

end
