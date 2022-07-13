class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|

      t.timestamps
      t.integer :article_id, null: false, default: ""
      t.integer :user_id, null: false, default: ""
    end
  end
end
