class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

      t.timestamps
      t.integer :follower_id, null: false, default: ""
      t.integer :followed_id, null: false, default: ""
    end
  end
end
