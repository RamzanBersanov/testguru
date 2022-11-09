class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.belongs_to :test, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
