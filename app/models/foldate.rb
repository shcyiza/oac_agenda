class Foldate < ActiveRecord::Base
  # Model made enable the user to follow an specific day in the calendar and having the feeds of all activities of happening in it
  belongs_to :user
  
  validates :user_id, presence: true, uniqueness: { scope: :datefolwd, if: :new_record?, message: "Vous suivez déjà cette date"}
  validates :datefolwd, presence: true, date: { after: Date.today - 1.day, message: "Doit être après aujourd'hui" }

  def month
    self.datefolwd.strftime('%m%Y')
  end

end
