require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without commenter" do
    comment = Comment.new
    assert !comment.save
  end
end
