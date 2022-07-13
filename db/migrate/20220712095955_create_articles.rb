class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|

      t.timestamps
      t.integer :user_id, null: false, default: ""
      t.string :title, null: false, default: ""
      t.text :body, null: false, default: ""
      t.integer :open_close, null: false, default: "true"
    end
  end
end
