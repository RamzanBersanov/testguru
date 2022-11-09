class CreateTestsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :tests_users do |t|
      t.belongs_to :test, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true, null: false
      t.boolean :complete, default: false, null: false

      t.timestamps
    end
  end
end
