class AddBrandToProducts < ActiveRecord::Migration
  def change
    add_column :products, :brand, :string
    add_column :products, :primary, :string
    add_column :products, :secondary, :string
    add_column :products, :size, :string
    add_column :products, :color, :string
    add_index :products, :brand
    add_index :products, :primary
    add_index :products, :secondary
    add_index :products, :size
    add_index :products, :color
    add_index :products, :price

  end
end
