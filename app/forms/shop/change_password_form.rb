class Shop::ChangePasswordForm
  include ActiveModel::Model

  attr_accessor :object, :current_password, :new_password, :new_password_confirmation

  validates :current_password, presence: true
  validates :new_password, presence: true, confirmation: true

  validate do
    unless object.authenticate(current_password)
      errors.add(:current_password, :wrong)
    end
  end

  def save
    if valid?
      object.password = new_password
      object.save!
    end
  end
end