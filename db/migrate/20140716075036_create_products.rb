class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :products, :name
  end
end
