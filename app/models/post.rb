class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }

  has_many :comments, dependent: :destroy

  state_machine :state, initial: :unviewed do
    state :viewed
    state :unviewed

    event :view do
      transition :unviewed => :viewed
    end
  end

  paginates_per 10
end