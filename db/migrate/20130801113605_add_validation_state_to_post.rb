class AddValidationStateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :validation_state, :string
  end
end
