class Event < ActiveRecord::Base
  belongs_to :orgn
  has_one :user, through: :orgn
  has_many :folevents
  has_many :resa
  has_many :activities, as: :trackable
  has_and_belongs_to_many :tags
  acts_as_paranoid column: :deleted_at
  extend TimeSplitter::Accessors
    split_accessor :esdate, :eedate

#validation of the dates for events, events starts (=esdate) after the actual time and end date (=eedate) after event start
  validates :esdate, date: { after: Time.now, message: "Doit être après aujourd'hui" }
  validates :eedate, date: { after: :esdate, allow_blank: true, message: "Doit être après le debut de l'événement" }

#default avatar when no images uploaded
  has_attached_file :flyer, styles: { medium: "300x270#", thumb: "100x90#" }, default_url: "/images/normal/missing_flyer.png"
  validates_attachment_content_type :flyer, content_type: /\Aimage\/.*\Z/

# instance method to gather all the dates composing an event
    def days
      r = (self.esdate.to_date..self.eedate.to_date).to_a
    end

# instance method to gather all the hashtags in the descpriction of the event
    def event_tags
      self.edesc.scan(/#\w+/)
    end

# instance method if it's needed to separate the days from arrays
    def day
      days.each do |day|
      end
    end

# instance method to get the month where the events happen its useful to group event by mouths like done in events#index
    def month
      self.esdate.strftime('%m%Y')
    end

    def user_id
      self.orgn.user.id
    end

# is gonna be usefull in the future to order
    def days_left
      days_left = 0
      self.days.each do |date|
        if date >= Date.today
         days_left += 1
        end
      end
      days_left
    end

# class method written have an array of all the events that are not past
    def self.still_relevent
      where('eedate >= ?', Date.today.end_of_day )
    end



  after_create do
    hashtags = self.edesc.scan(/#\w+/)
    hashtags.uniq.map do   |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag
    end
  end

  before_update do
    self.tags.clear #tout supprimé pour tout rajouté
    hashtags = self.edesc.scan(/#\w+/)
    hashtags.uniq.map do   |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag
    end
  end

  def self.event_on_event_day(events_collection, tracked_event)
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

  def self.find(*args)
    if args.first.to_s == "random"
      ids = connection.select_all("SELECT id FROM events")
      super(ids[rand(ids.length)]["id"].to_i)
    else
      super
    end
  end

end
