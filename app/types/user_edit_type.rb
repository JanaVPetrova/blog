class UserEditType < User
  include BaseType

  permit :login, :password, :email

  validates :login, presence: true
  validates :password, presence: true
  validates :email, presence: true,
                    email: true
end