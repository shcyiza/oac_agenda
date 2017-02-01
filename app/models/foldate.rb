class Foldate < ActiveRecord::Base
  # Model made enable the user to follow an specific day in the calendar and having the feeds of all activities of happening in it
  belongs_to :user
  validates :user_id, presence: true, uniqueness: { scope: :datefolwd, if: :new_record?, message: "Vous suivez déjà cette date"}
  validates :datefolwd, presence: true, date: { after: Date.today - 1.day, message: "Doit être après aujourd'hui" }

  def month
    self.datefolwd.strftime('%m%Y')
  end

  def self.still_relevent
    Foldate.where('datefolwd >= ?', Date.today)
  end

  def self.on_event_days(event)
    likes_at_event_days = []
    Foldate.still_relevent.each do |like|
      if event.days.include?(like.datefolwd) == true
        likes_at_event_days  << like
      end
    end
    likes_at_event_days
  end

  def self.likes_at_event_days(selected_events, tracked_likes)
    likes_at_event_days = 0
    selected_events.each do |event|
      if event.days.include?(tracked_likes.datefolwd) == true && event.created_at <= tracked_likes.created_at
        likes_at_event_days  += 1
      end
    end
    likes_at_event_days
  end

  def self.likes_that_day(tracked_event, user)
   likes_that_day = 0
   user.foldates.where("created_at <= ?", tracked_event.updated_at || tracked_event.created_at  ).each do |foldate|
     if tracked_event.days.include?(foldate.datefolwd) == true
         likes_that_day  += 1
     end
   end
   likes_that_day
  end

  def self.likes_same_day(likes_collection, tracked_likes)
    likes_same_day = 0
    likes_collection.where("created_at <= ?" , tracked_likes.created_at ).each do |date_to_track|
      if date_to_track.datefolwd == tracked_likes.datefolwd && date_to_track.created_at <= tracked_likes.created_at
        likes_same_day  += 1
      end
    end
    likes_same_day
  end

end
