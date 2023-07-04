class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :user_allergies

    end
    add_index :users, :email
    add_index :users, :username
  end
end
