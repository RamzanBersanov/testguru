class AddSuccessAttributeToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :success, :string, null: false, default: :false
  end
end
