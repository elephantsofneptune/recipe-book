class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.references :cookbook, foreign_key: true
      t.string :title
      t.text :ingredients, array: true, default: []
      t.text :steps, array: true, default: []
      t.integer :view_count

      t.timestamps
    end
  end
end
