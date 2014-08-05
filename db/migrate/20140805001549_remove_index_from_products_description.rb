class RemoveIndexFromProductsDescription < ActiveRecord::Migration
  def change
  	remove_column :products, :description
  	add_column :products, :description, :string, :limit => nil
  end
end
