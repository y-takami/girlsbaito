class Route < ActiveRecord::Base
  has_many :stations
  has_many :prefectures, through: :stations
  has_many :shop_shows
end
