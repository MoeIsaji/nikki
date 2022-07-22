class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|

      t.timestamps
      t.integer :customer_id, null: false, default: ""
      t.string :title, null: false, default: ""
      t.text :body, null: false, default: ""
      t.boolean :open_close, null: false, default: "true"
    end
  end
end
