class CreateCookbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cookbooks do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description, default: "N/A"
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
