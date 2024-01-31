class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 100
      t.text :description, null: false
      t.decimal :price, null: false, precision: 10, scale: 2
      t.integer :quantity, null: false, default: 0
      t.references :category, null: false, foreign_key: true, index: true
      t.datetime :deleted_at
      t.timestamps

      t.index :deleted_at
    end
  end
end
