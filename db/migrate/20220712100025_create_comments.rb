class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :article_id, null: false
      t.integer :customer_id, null: false
      t.text :comment, null: false
    end
  end
end
