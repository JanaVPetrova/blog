class Post < ActiveRecord::Base
  include UsefullScopes
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :subject, presence: true

  belongs_to :user
  belongs_to :subject

  has_many :comments, dependent: :destroy

  audit :title, :subject, :text

  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  state_machine :state, initial: :unpublished do
    state :published do
      validates :text, presence: true
    end

    state :unpublished

    event :publish do
      transition unpublished: :published
    end

    event :hide do
      transition published: :unpublished
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