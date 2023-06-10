class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :gist_url
      t.string :creator_email
      t.text :question_body

      t.timestamps
    end
  end
end
