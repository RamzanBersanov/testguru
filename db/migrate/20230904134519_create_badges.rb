class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.text :picture, null: false
      t.text :rule, null: false
      t.text :given_for, null: false
      t.references :user, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
