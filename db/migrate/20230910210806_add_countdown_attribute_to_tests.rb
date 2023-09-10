class AddCountdownAttributeToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :countdown, :integer, null: false
  end
end
