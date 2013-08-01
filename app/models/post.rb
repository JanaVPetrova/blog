class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }

  has_many :comments, dependent: :destroy

  state_machine :state, initial: :unpublished do
    state :published
    state :unpublished


    event :publish do
      transition :unpublished => :published
    end
  end

  paginates_per 10
end