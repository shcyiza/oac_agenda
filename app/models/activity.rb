class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true


  def event_start_end_dates
    esdate and eedate
  end

end
