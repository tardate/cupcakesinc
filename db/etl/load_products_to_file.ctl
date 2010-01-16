
#puts "executing load_products_to_file.ctl"

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

destination :out, {
  :file => 'source_data/products_processed.txt'
},
{
  :order => [:name, :description, :unit_price]
}