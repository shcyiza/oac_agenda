class Foldate < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true, uniqueness: { scope: :datefolwd, if: :new_record?, message: "Vous suivez déjà cette date"}
  validates :datefolwd, presence: true, date: { after: Date.today - 1.day, message: "Doit etre après aujourd'hui" }

end
