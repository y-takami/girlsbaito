module EmailHolder
  extend ActiveSupport::Concern

  included do
    include StringNormalizer

    before_validation do
      self.email = normalize_as_email(email)
      self.email = email.downcase if email
    end

    validates :email, presence: true, uniqueness: true, email: {allow_blank: true}

  end
end
