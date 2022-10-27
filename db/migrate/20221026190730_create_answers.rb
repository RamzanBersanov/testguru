class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: true, null: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end

# Для атрибута correct у Ответа
# в миграции нет такого атрибута. 
# Там почему то стоит статус. Тип integer. А значение по умолчанию текстовое.
# поле `correct` может по сути иметь только 2 значния "да" или "нет"
# когда поле подразумевает только 2 значения пользуются типом `boolean`
# (логическое поле, которое может содержать только `true`/`false` значения)
