class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: '1', null: false
      t.belongs_to :author, null: false, index: true, foreign_key: { to_table: :users }
      t.belongs_to :category, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
