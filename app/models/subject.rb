class Subject < ActiveRecord::Base
  include SubjectRepository

  validates :title, presence: true

  has_many :posts
end
