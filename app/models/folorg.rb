class Folorg < ActiveRecord::Base
# model to link a user to an organisation and get activity feeds of it
  belongs_to :user
  belongs_to :orgn

  validates :user_id, uniqueness: { scope: :orgn_id, if: :new_record?, message: "Vous suivez déjà cette organisation."}

end
