class User < ActiveRecord::Base
  has_many :resas
  has_many :orgns
  has_many :folorgs
  has_many :folevents
  has_many :orgns, through: :folorgs
  has_many :events, through: :folevents
  has_many :events, through: :resas
  has_many :events, through: :orgns
  has_many :foldates, through: :orgns

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
