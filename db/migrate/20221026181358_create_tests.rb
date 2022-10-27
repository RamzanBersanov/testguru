class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: '1', null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# При создании теста, про атрибут автор для теста.
# Лучше если поле в таблице будет называться author_id.
# Так как по логике нам надо создать связь теста с юзером как автор теста
# т.е. должно получиться
# t.references :author...
# Но учти чтоб внешний ключ смотрел на таблицу юзеров
# для foreign_key нужно использовать опцию to_table
