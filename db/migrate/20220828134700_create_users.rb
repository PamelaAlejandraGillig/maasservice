class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :full_name, null: false
      t.string :color, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
