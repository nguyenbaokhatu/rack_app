$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path('../', File.dirname(__FILE__))

require 'rack'
require 'tilt'
require 'dotenv/load'

require 'bcrypt'
require 'erb'
require 'active_record'
require 'action_mailer'
ActionMailer::Base.prepend_view_path( File.expand_path('../app/views/', __dir__))

require "letter_opener"
ActionMailer::Base.add_delivery_method :letter_opener, LetterOpener::DeliveryMethod, :location => File.expand_path('../tmp/letter_opener', __FILE__)
ActionMailer::Base.delivery_method = :letter_opener

require 'app/mailers/application_mailer.rb'
require 'app/mailers/user_mailer.rb'
ActiveRecord::Base.logger = Logger.new(STDOUT)

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
require 'app/controllers/products_controller.rb'
