class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :open_close, null: false, default: true
    end
  end
end
