class Admin < ActiveRecord::Base
  include EmailHolder
  include PasswordHolder
  has_secure_password

end
