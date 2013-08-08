class UserSignInType
  include BaseTypeWithoutActiveRecord

  attribute :login, String
  attribute :password, String

  validates :login, presence: true
  validates :password, presence: true
  validate :check_authentification

  def user
    User.find_by_login login
  end

  private
  def check_authentification
    if !(user.try(:password) == password)
      errors.add(:password, :user_or_password_invalid)
    end
  end
end