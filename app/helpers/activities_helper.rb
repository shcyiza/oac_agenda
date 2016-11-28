module ActivitiesHelper

    def likes_at_event_days(selected_events, tracked_likes)
      likes_at_event_days = 0
      selected_events.each do |event|
        if event.days.include?(tracked_likes.datefolwd) == true && event.created_at <= tracked_likes.created_at
          likes_at_event_days  += 1
        end
      end
      likes_at_event_days
    end

    def likes_that_day(tracked_event)
     likes_that_day = 0
     current_user.foldates.where("created_at <= ?", tracked_event.updated_at || tracked_event.created_at  ).each do |foldate|
       if tracked_event.days.include?(foldate.datefolwd) == true
           likes_that_day  += 1
       end
     end
     likes_that_day
    end

    def likes_same_day(likes_collection, tracked_likes)
      likes_same_day = 0
      likes_collection.where("created_at <= ?" , tracked_likes.created_at ).each do |date_to_track|
        if date_to_track.datefolwd == tracked_likes.datefolwd && date_to_track.created_at <= tracked_likes.created_at
          likes_same_day  += 1
        end
      end
      likes_same_day
    end

end
