class SetInitialApprovementState < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def up
    User.reset_column_information
    User.update_all approvement_state: :unapproved
  end

  def down
  end
end
