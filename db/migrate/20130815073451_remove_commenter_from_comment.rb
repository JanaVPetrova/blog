class RemoveCommenterFromComment < ActiveRecord::Migration
  def change
    remove_column :post_comments, :commenter
  end
end
