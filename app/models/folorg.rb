class Folorg < ActiveRecord::Base
  belongs_to :user
  belongs_to :orgn

  validates :user_id, uniqueness: { scope: :orgn_id, if: :new_record? message: "Vous suivez déjà cette organisation."}

end
