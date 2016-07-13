class Orgn < ActiveRecord::Base
  belongs_to :user
  has_many :events
  has_many :foldates
  has_many :folorgs
  has_many :users, through: :folorgs

end
