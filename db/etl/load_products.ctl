
#puts "executing load_products.ctl"

ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :file => 'source_data/products.csv',
  :skip_lines => 1,
  :encoding => 'latin1',
  :parser => {
    :name => :delimited
  }

}, 
[ 
  :name,
  :description,
  :unit_price
]

before_write :check_exist, {
  :target => :development, 
  :table => 'products', 
  :columns => [:name]
}

destination :out, {
  :type => :database,
  :target => :development,
  :database => 'cupcake_development',
  :table => 'products',
  :encoding => 'utf-8'
},
{
  :order => [:name, :description, :unit_price]
}