class Product < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = "product"
end
