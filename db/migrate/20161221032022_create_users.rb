class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.text :description, default: "N/A"
      t.string :type, default: "N/A"
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
