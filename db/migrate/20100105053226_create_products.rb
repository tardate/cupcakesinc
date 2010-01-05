class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :recipe_id
      t.decimal :unit_price, :precision => 5, :scale => 2
      t.timestamps
    end
  end
  
  def self.down
    drop_table :products
  end
end
