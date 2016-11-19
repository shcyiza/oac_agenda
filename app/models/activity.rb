class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true

#this method as been created to make the previous activity method shorter
  def event_start_end_dates
    esdate and eedate
  end

end
