class User < ActiveRecord::Base
  validates :login, presence: true,
                    uniqueness: true
  validates :password, presence: true

  has_many :comments
end
