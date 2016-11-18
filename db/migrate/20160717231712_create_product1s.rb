class CreateProduct1s < ActiveRecord::Migration
  def change
    create_table :product1s do |t|
      t.string :name
      t.float :price
      t.string :unit
      t.boolean :in_stock
      t.date :available_from
      t.integer :category

      t.timestamps
    end
  end
end
