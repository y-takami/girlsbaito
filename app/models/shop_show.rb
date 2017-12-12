class ShopShow < ActiveRecord::Base

  include StringNormalizer

  mount_uploader :main_image, MainImageUploader
  mount_uploader :image1, Image1Uploader
  mount_uploader :image2, Image2Uploader
  mount_uploader :image3, Image3Uploader
  mount_uploader :license, LicenseUploader

  belongs_to :shop_info, :autosave => true
  has_many :applies
  has_many :girls, through: :applies
  has_one :feature, dependent: :destroy
  belongs_to :prefecture
  belongs_to :city
  belongs_to :station
  belongs_to :route
  belongs_to :category
  accepts_nested_attributes_for :feature



  before_validation do
    self.line_id = normalize_as_email(line_id)
  end

  validates :shop_name, :prefecture_id, :city_id, :house_number, :url,
            :payment_hour_low, :payment_hour_high, :payment_day, :category_id, :job_content,
            :route_id, :station_id, :title, :summary, :congratulation_money, :message, :line_id,
            :note, presence: true

  REGION_NAMES = %w(北海道 東北 関東・東京 中部・東海 関西 中国・四国 九州・沖縄)


end