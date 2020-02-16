$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path('../', File.dirname(__FILE__))

require 'rack'
require 'tilt'
require 'dotenv/load'

require 'bcrypt'
require 'erb'
require 'active_record'

#ENV['APP_ENV'] || 'development'
# .env.development
# .env.test
APP_ENV='development'
DATABASE_USER_NAME='khatu'
DATABASE_PASSWORD='123456'
DATABSE_URL='rack_app'

require_relative '../config/database'
require 'app/validators/category_validator.rb'

require 'app/models/user.rb'
require 'app/models/product.rb'
require 'app/models/category.rb'
require 'app/models/order.rb'
require 'app/models/order_detail.rb'

module Frack
  autoload :Router, 'frack/router'
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
end

require 'app/controllers/users_controller.rb'
require 'app/controllers/welcome_controller.rb'
