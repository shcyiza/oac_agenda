class Folevent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :user_id, presence: true, uniqueness: { scope: :datefolwd, if: :new_record?, message: "Vous suivez déjà cette dates"}


end
