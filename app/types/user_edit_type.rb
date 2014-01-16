class UserEditType < User
  include BaseType

  permit :login, :password, :email, :approvement_state_event

  validates :login, presence: true
  validates :password, presence: true
end