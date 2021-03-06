class VisitorsController < ApplicationController
before_action :authenticate_user!, only: [:mboka]

  def index
    if user_signed_in?
      if (Time.now - 20..Time.now).cover?(current_user.created_at)
        redirect_to '/3etapes'
      elsif current_user.sign_in_count <= 1 && (Time.now - 20..Time.now).cover?(current_user.updated_at) && current_user.orgns.count < 1
        redirect_to '/3etapes'
      else
        redirect_to mboka_path
      end
    end
  end

  def mboka
    @events = Event.still_relevent
    @comming_events = Event.still_relevent.order(esdate: :asc).take(8)
    @orgns = Orgn.sort_by_events.take(4)
    @folorgs = Folorg.all
    @activities = Activity.whatsnew_activities
  end

  def firstconnection
    if user_signed_in?
      @orgn = Orgn.new(user_id: current_user.id)
    end
  end

end
