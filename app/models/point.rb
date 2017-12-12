class Point < ActiveRecord::Base

  belongs_to :girl
  belongs_to :congratulation

  validates :amount, presence: true


end
