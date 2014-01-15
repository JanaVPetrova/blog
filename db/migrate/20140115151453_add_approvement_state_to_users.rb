class AddApprovementStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :approvement_state, :string
  end
end
