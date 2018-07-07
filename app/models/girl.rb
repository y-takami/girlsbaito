class Girl < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :applies, dependent: :destroy
  has_many :shop_shows, through: :applies
  has_many :invitations
  has_many :points

#  validates :name, presence: true
#  validates :nickname, presence: true
  validates :invitation_code, uniqueness: {allow_blank: true}, presence: true


end