class ShopInfo < ActiveRecord::Base

  include StringNormalizer
  include PasswordHolder
  has_secure_password

  has_many :shop_shows, dependent: :destroy
  accepts_nested_attributes_for :shop_shows, :allow_destroy => true
  before_validation do
    self.admin_name_sei = normalize_as_furigana(admin_name_sei)
    self.admin_name_mei = normalize_as_furigana(admin_name_mei)
    self.manager_name_sei = normalize_as_furigana(manager_name_sei)
    self.manager_name_mei = normalize_as_furigana(manager_name_mei)
    self.admin_email = normalize_as_email(admin_email)
    self.admin_email = admin_email.downcase
    self.billing_email = normalize_as_email(billing_email)
    self.postal_first = normalize_as_email(postal_first)
    self.postal_last = normalize_as_email(postal_last)
    self.url = normalize_as_email(url)
    self.admin_tel = normalize_as_email(admin_tel)
  end

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  validates :admin_name_sei, :admin_name_mei, :manager_name_sei, :manager_name_mei,
            presence: true, format: {with: KATAKANA_REGEXP, allow_blank: true}
  validates :billing_email, presence: true, email: {allow_blank: true}, confirmation: true
  validates :admin_email, uniqueness: {allow_blank: true}, presence: true, email: {allow_blank: true}, confirmation: true
  validates :group_number, :shop_name, :url, :admin_name,
            :admin_tel, :billing_company, :manager_name, :billing_tel, :postal_first, :postal_last,
            :prefecture, :city, :house_number, presence: true



end
