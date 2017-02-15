class User < ActiveRecord::Base
  has_many :resas
  has_many :orgns
  has_many :events, through: :orgns
  has_many :folorgs
  has_many :folevents
  has_many :foldates
  has_many :activities
  has_many :messages


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

   def followed_activities
     followed_activities = []
     Activity.from_others(self).order('created_at DESC').each do |activity|
       case activity.trackable_type
       when "Event"
         if Event.exists?(id: activity.trackable_id)
           if Foldate.likes_that_day(activity.trackable, self) > 0 || Event.event_on_event_day(self.events, activity.trackable).count > 0
             activity.add_to_the_array(followed_activities)
           elsif self.folorgs.where("created_at <= ?", activity.trackable.created_at ).where(orgn_id: activity.trackable.orgn_id).count > 0 || self.folevents.where("created_at <= ?", activity.trackable.created_at ).where(event_id: activity.trackable.id).count > 0
             activity.add_to_the_array(followed_activities)
           end
         end
       when "Foldate"
         if Foldate.exists?(id: activity.trackable_id)
           if Foldate.likes_at_event_days(self.events, activity) > 0 || Foldate.likes_same_day(self.foldates, activity) > 0
             activity.add_to_the_array(followed_activities)
           end
         end
       end
     end
     return followed_activities
   end

   def not_seen_activities
     not_seen_activity = []
     self.followed_activities.each do |activity|
       if activity.created_at > self.default_values
         activity.add_to_the_array(not_seen_activity)
       end
     end
     return not_seen_activity
   end

   def default_values
     if self.last_click_at != nil
       self.last_seen_at
     else
       self.created_at
     end
   end

   def is_admin?
     if self.is_admin
       return true
     else
       return false
     end
   end

   def is_pro?
     if self.pro
       return true
     else
       return false
     end
   end

   after_create :send_admin_mail
   def send_admin_mail
     UserMailer.welcome_and_confirmation(self).deliver_later
   end
end
