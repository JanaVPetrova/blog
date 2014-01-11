class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }

  belongs_to :user
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true

  state_machine :state, initial: :unpublished do
    state :published
    state :unpublished

    event :publish do
      transition :unpublished => :published
    end
  end

  #scope :published, -> { where state: "published" }
  include PostRepository

  state_machine :validation_state, initial: :restored do
    state :restored
    state :deleted

    event :mark_as_deleted do
      transition :restored => :deleted
    end

    event :restore do
      transition :deleted => :restored
    end
  end
end