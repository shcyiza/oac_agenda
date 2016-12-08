class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  def tracked_event
    Event.find(self.trackable_id)
  end

  def self.from_others(user)
    where.not(user_id: user.id).order("created_at desc")
  end

  def last_update(user)
    self.id == Activity.from_others(user).where(:created_at => (self.created_at.beginning_of_day..self.created_at.end_of_day), :trackable_id => self.tracked_event.id).first.id
  end

  def previous_activity
    Activity.where(:trackable_type => "#{self.trackable_type}", :trackable_id => self.trackable.id).where("created_at < ?", self.created_at).last
  end

#this method as been created to make the previous activity method shorter
  def event_start_end_dates
    esdate and eedate
  end

  def add_to_the_array(array)
    if array.include?(self) == false
      array << self
    end
  end

end
