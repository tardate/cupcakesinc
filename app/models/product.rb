class Product < ActiveRecord::Base
  attr_accessible :name, :description, :recipe_id, :unit_price
end
