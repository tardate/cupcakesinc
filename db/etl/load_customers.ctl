
#puts "executing load_customers.ctl"

ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :file => 'source_data/customers2.csv',
  :skip_lines => 1,
  :parser => {
    :name => :delimited
  }

}, 
[ 
  :name
]

pre_process :truncate, :target => :development, :table => 'customers'

before_write :check_exist, {
  :target => :development, 
  :table => 'customers', 
  :columns => [:name]
}

#before_write :surrogate_key, :target => :data_warehouse, :table => 'person_dimension', :column => 'id'
#transform :description, :name
#transform(:description) { |v| "#{:name} Bakery" }

destination :out, {
  :type => :database,
  :target => :development,
  :database => 'bizapp_development',
  :table => 'customers'
},
{
  :order => [:name ]
}