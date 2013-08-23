class Post::Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  has_ancestry

  #validates :commenter, presence: true
end
