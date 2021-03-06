class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 50
      t.string :email
      t.string :password_digest, limit: 255
      t.string :name, limit: 60
      t.string :surname, limit: 60
      t.string :address, limit: 100
      t.string :token, limit: 100
      t.boolean :enabled

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
