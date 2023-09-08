class AddCountdownAndEndTimeAttributesToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :countdown, :integer, null: false
    add_column :tests, :end_time, :datetime
  end
end
