class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|

      t.timestamps
      t.string :user_name, null: false, default: ""
      t.string :introduction, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :password, null: false, default: ""
      t.boolean :is_active, null: false, default: "true"

    end
  end
end
