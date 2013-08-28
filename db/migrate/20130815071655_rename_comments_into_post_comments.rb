class RenameCommentsIntoPostComments < ActiveRecord::Migration
  def change
    rename_table :comments, :post_comments
  end
end
