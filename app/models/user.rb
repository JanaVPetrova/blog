class User < ActiveRecord::Base
  validates :login, presence: true,
                    uniqueness: true
  validates :password, presence: true
  validates :email, presence: true

  has_many :comments

  state_machine :approvement_state, initial: :unapproved do
    state :approved
    state :unapproved

    event :approve do
      transition unapproved: :approved
    end

    event :unapprove do
      transition approved: :unapproved
    end
  end
end
