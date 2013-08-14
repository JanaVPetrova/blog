class PostEditType < Post
  include BaseType

  permit :title, :text, :state_event, :validation_state_event

  validates :title, presence: true
  validates :text, presence: true
end