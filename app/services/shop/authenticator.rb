class Shop::Authenticator
  def initialize(shop)
    @shop = shop
  end

# def authenticate(raw_password)
#   @shop &&
#    @shop.hashed_password &&
#   BCrypt::Password.new(@shop.hashed_password) == raw_password
# end
end