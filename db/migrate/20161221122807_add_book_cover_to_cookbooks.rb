class AddBookCoverToCookbooks < ActiveRecord::Migration[5.0]
  def change
    add_column :cookbooks, :book_cover, :string
  end
end
