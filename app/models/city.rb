class City < ActiveRecord::Base
  has_many :shop_shows
  belongs_to :prefecture
end
