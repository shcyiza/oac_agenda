module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def today
    Date.today
  end

  def start_date
    if params[:gotomonth] or params[:gotoyear]
      params.fetch(:start_date, "01/#{params[:gotomonth]}/#{params[:gotoyear]}".to_date).to_date
    else
      params.fetch(:start_date, today).to_date
    end
  end

  def date_range
    (start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).to_a
  end

  def events_that_day(date,event_collection)
   events_that_day = []
   event_collection.each do |event|
     if event.days.include?(date) == true
       events_that_day  << event
     end
    end
    return events_that_day
  end

  def event_on_event_day(events_collection, tracked_event)
     event_on_event_day = 0
     events_collection.each do |event|
       tracked_event.days.each do |date|
         if event.days.include?(date) == true && event.created_at <= tracked_event.created_at
          event_on_event_day  << event
           end
         end
       end
      return event_on_event_day
    end

  def every_followed_dates
    Foldate.where('datefolwd > ?', Time.now).where(user: current_user).order(datefolwd: :asc)
  end

  def dates_grouped
    every_followed_dates.group_by(&:month)
  end

  def is_new
    (Time.now - 20..Time.now)
  end

end
