class CreateTestsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users do |t|
      t.references :test, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.boolean :complete, default: false, null: false

      t.timestamps
    end
  end
end
