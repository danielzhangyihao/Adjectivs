class RemoveColumnFromProductsDescription < ActiveRecord::Migration
  def change
  	remove_column :products, :description
  	add_column :products, :description, :text, :limit => nil
  end
end
