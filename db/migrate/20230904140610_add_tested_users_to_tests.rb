class AddTestedUsersToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :tested_user, foreign_key: { to_table: :users }
  end
end
