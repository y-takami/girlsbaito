class Prefecture < ActiveRecord::Base
  has_many :cities
  has_many :stations
  has_many :shop_shows
  has_many :routes, through: :stations
end
