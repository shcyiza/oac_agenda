class Orgn < ActiveRecord::Base
  # "Orgn" is an abbreviation of organisation, not really the rails way i understood
  belongs_to :user
  has_many :events
  has_many :foldates
  has_many :folorgs
  has_many :users, through: :folorgs

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/normal/missing_avatar.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def organisation_likes
    self.folorgs
  end

  def likes_counter
    if self.organisation_likes.count > 0
      self.organisation_likes.count
    end
  end

  def events_counter
    self.events.still_relevent.count
  end

  def self.sort_by_events
    all.sort {|a,b| b.events_counter <=> a.events_counter}
  end

end
