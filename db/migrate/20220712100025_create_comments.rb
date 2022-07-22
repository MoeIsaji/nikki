class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :article_id, null: false, default: ""
      t.integer :customer_id, null: false, default: ""
      t.text :comment, null: false, default: ""
    end
  end
end
