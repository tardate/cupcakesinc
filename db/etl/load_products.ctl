
#puts "executing load_products.ctl"

ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :file => 'source_data/products.csv',
  :skip_lines => 1,
  :parser => {
    :name => :delimited
  }

}, 
[ 
  :name,
  :description,
  :unit_price
]

#before_write :surrogate_key, :target => :data_warehouse, :table => 'person_dimension', :column => 'id'

destination :out, {
  :type => :database,
  :target => :development,
  :database => 'bizapp_development',
  :table => 'products'
},
{
  :order => [:name, :description, :unit_price]
}