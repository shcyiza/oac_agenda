class Orgn < ActiveRecord::Base
  # "Orgn" is an abbreviation of organisation, wich
  belongs_to :user
  has_many :events
  has_many :foldates
  has_many :folorgs
  has_many :users, through: :folorgs

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/normal/missing_avatar.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
