class Resa < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  #Pour faire un voucher par combinaison
  validates :resanr, uniqueness: true, if: :new_record?
  #pour avoir un voucher par personne
  validates :user_id, uniqueness: { scope: :envent_id, if: :new_record? message: "Vous suivez déjà reservé votre place."}

end
