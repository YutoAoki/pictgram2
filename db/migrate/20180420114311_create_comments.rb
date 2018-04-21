class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :topic_id
      t.string :comment_text

      t.timestamps
    end
  end
end
