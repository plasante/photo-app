class CreateListCategories < ActiveRecord::Migration
  def change
    create_table :list_categories do |t|
      t.references :list, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :description, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
