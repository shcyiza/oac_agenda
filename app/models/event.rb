class Event < ActiveRecord::Base
  belongs_to :orgn
  has_many :folevents
  has_many :resas
  has_many :users, through: :folevents
  has_many :users, through: :resas

  validates :esdate, presence: true, date: { after: Date.today, message: "Doit etre après aujourd'hui" }
  validates :eedate, date: { after: :esdate, allow_blank: true, message: "Doit etre après le debut de l'événement" }

  def event_dates
    r = (self.esdate.to_date..self.eedate.to_date).to_a
  end

end
