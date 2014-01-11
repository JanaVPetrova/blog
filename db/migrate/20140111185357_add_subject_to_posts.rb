class AddSubjectToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :subject, index: true
  end
end
