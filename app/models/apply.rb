class Apply < ActiveRecord::Base

  belongs_to :girl
  belongs_to :shop_show
  has_one :congratulation

  validates :name, :email, :line_id, :tel, :method, presence: true
  validates_date :interview, if: :after_created_at?
  validates :interview, presence: true, if: :after_created_at?
  validates :employment, inclusion: {in: [true, false]}, if: :after_created_at?

  def after_created_at?
    if self.created_at
      Time.now>=self.created_at+1.minutes
    end
  end
end
