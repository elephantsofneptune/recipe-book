class ChangeColumnOnCookbooks < ActiveRecord::Migration[5.0]
  def change
  	change_column :cookbooks, :book_cover, :string, :default => "http://www.librarything.com/wiki/images/3/34/Book-cover-black.jpg"
  	change_column :users, :avatar, :string, :default => "https://cdn4.iconfinder.com/data/icons/user-avatar-flat-icons/512/User_Avatar-46-512.png"
  end
end
