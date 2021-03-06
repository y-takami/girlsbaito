class Congratulation < ActiveRecord::Base
  include StringNormalizer
  belongs_to :apply, :autosave => true
  has_one :point
  belongs_to :girl

  before_validation do
    self.name_sei_kana = normalize_as_furigana(name_sei_kana)
    self.name_mei_kana = normalize_as_furigana(name_mei_kana)
    self.email = normalize_as_email(email)
    self.email = email.downcase
    self.postal_first = normalize_as_email(postal_first)
    self.postal_last = normalize_as_email(postal_last)
    self.tel = normalize_as_email(tel)
  end

  validates_date :interview
  validates_date :first_work_day
  validates :first_work_flag, :method, :interview, :first_work_day, :policy, presence: true

  validates :bank_name, :bank_branch_name, :bank_type, :bank_number, presence: true, if: :method_bank?

  validates :postal_first, :postal_last, :prefecture, :city, :house_number, presence: true, if: :method_amazon?
  validates :postal_first, :postal_last, :prefecture, :city, :house_number, presence: true, if: :method_itunes?

  def method_amazon?
    method=="アマゾンギフトカード"
  end
  def method_itunes?
    method=="iTunesカード"
  end

  def method_bank?
    method=="銀行振込"
  end


end