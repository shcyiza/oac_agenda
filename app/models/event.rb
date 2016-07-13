class Event < ActiveRecord::Base
  belongs_to :orgns
  has_many :folevents
  has_many :resas
  has_many :users, through: :folevents
  has_many :users, through: :resas

end
