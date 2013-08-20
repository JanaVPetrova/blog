class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :title, presence: true,
                    length: { minimum: 5 }

  belongs_to :user
  has_many :comments, dependent: :destroy

  state_machine :state, initial: :unpublished do
    state :published
    state :unpublished

    event :publish do
      transition :unpublished => :published
    end
  end

  scope :published, -> { where state: "published" }

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

  paginates_per 10
end