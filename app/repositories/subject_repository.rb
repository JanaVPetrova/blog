module SubjectRepository
  extend ActiveSupport::Concern

  included do
    has_many :published_posts, -> { where(validation_state: :restored).where(state: :published) },
                                  class_name: 'Post'
  end
end
