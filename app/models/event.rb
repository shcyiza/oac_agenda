class Event < ActiveRecord::Base
  belongs_to :orgn
  has_many :folevents
  has_many :activities, as: :trackable
  has_many :resas
  has_many :users, through: :folevents
  has_many :users, through: :orgn
  has_and_belongs_to_many :tags
  extend TimeSplitter::Accessors
    split_accessor :esdate, :eedate

  validates :esdate, date: { after: Time.now, message: "Doit etre après aujourd'hui" }
  validates :eedate, date: { after: :esdate, allow_blank: true, message: "Doit etre après le debut de l'événement" }


  has_attached_file :flyer, styles: { medium: "300x270#", thumb: "100x90#" }, default_url: "/images/normal/missing_flyer.png"
  validates_attachment_content_type :flyer, content_type: /\Aimage\/.*\Z/

    def days
      r = (self.esdate.to_date..self.eedate.to_date).to_a
    end

    def event_tags
      self.edesc.scan(/#\w+/)
    end

    def previous_activity(activity)
      Activity.where(:trackable_type => 'Event', :trackable_id => self.id).where("created_at < ?", activity.created_at).last
    end

    def day
      days.each do |day|
      end
    end

    def that_day
      self.day.include?(Date.today - 1)
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

end
