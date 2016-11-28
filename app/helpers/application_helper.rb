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
     event_on_event = []
     events_collection.each do |event|
       tracked_event.days.each do |date|
         if event.days.include?(date) == true && event.created_at <= tracked_event.created_at
          event_on_event  << event
           end
         end
       end
      return event_on_event
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

  def followed_activities
    followed_activities = []
    Activity.from_others(current_user).order('created_at DESC').each do |activity|
      case activity.trackable_type
      when "Event"
        if Event.exists?(id: activity.trackable_id)
          if likes_that_day(activity.trackable) > 0 || event_on_event_day(current_user.events, activity.trackable).count > 0
            add_to_the_array(followed_activities, activity)
          elsif current_user.folorgs.where("created_at <= ?", activity.trackable.created_at ).where(orgn_id: activity.trackable.orgn_id).count > 0 || current_user.folevents.where("created_at <= ?", activity.trackable.created_at ).where(event_id: activity.trackable.id).count > 0
            add_to_the_array(followed_activities, activity)
          end
        end
      when "Foldate"
        if Foldate.exists?(id: activity.trackable_id)
          if likes_at_event_days(current_user.events, activity) > 0 || likes_same_day(current_user.foldates, activity) > 0
            add_to_the_array(followed_activities, activity)
          end
        end
      end
    end
    return followed_activities
  end

    def add_to_the_array(array, activity)
      if array.include?(activity) == false
        array << activity
      end
    end

    def default_values
      if current_user.last_click_at != nil
        current_user.last_seen_at
      else
        current_user.created_at
      end
    end

    def not_seen_activities
      not_seen_activity = []
      followed_activities.each do |activity|
        if activity.created_at > default_values
          add_to_the_array(not_seen_activity, activity)
        end
      end
      return not_seen_activity
    end

    def not_seen_compter
      not_seen_activities.count if not_seen_activities.count > 0
    end

end
