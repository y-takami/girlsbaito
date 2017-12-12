class Girl < ActiveRecord::Base
  include EmailHolder
  include PasswordHolder
  has_secure_password
  has_many :applies, dependent: :destroy
  has_many :shop_shows, through: :applies
  has_many :invitations
  has_many :points


  validates :email, uniqueness: {allow_blank: true}, presence: true, email: {allow_blank: true}#, confirmation: true
#  validates :name, presence: true
#  validates :nickname, presence: true
  validates :invitation_code, uniqueness: {allow_blank: true}, presence: true


end