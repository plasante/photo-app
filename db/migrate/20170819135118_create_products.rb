class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :provider, index: true, foreign_key: true
      t.integer :price
      t.string :format
      t.integer :unit_price
      t.boolean :diabetic
      t.references :category, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true
      t.references :description, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
