class ChangeColumnNameOnUser < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :encrypted_password, :password_digest
  	rename_column :users, :salt, :password_confirmation
  	rename_column :users, :type, :type_of_cook
  end
end
