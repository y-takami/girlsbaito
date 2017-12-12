class Station < ActiveRecord::Base
  belongs_to :prefecture
  belongs_to :route
  has_many :shop_shows
end
