class Folevent < ActiveRecord::Base
# model to link a user to an event and get activity feeds of it
  belongs_to :user
  belongs_to :event

  validates :user_id, presence: true, uniqueness: { scope: :datefolwd, if: :new_record?, message: "Vous suivez déjà cette dates"}


end
