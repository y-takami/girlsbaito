class Contact < ActiveRecord::Base

  validates :belong, :name, :name_kana, :mail, :content, presence: true
  validates_acceptance_of :policy
  validates_acceptance_of :comfirm

end