class CreateTestsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :tests_users, id: false do |t|
      t.belongs_to :test
      t.belongs_to :user
    end
  end

end
