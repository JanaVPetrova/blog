class PostEditType < Post
  include BaseType

  permit :title, :text, :subject_id, :state_event, :validation_state_event, :image,
         comments_attributes: [:id, :body, :parent_id]

  validates :title, presence: true
end