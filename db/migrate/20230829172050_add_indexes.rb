# frozen_string_literal: true

class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :categories, :title
  end
end
