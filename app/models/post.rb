class Post < ActiveRecord::Base
  validates :title, presence: true
                    lendth: { minimum: 5 }
end
