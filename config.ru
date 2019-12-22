$LOAD_PATH << '.'
require 'rack'
require 'tilt'
require 'byebug'

require 'lib/frack'
require 'app/controllers/users_controller.rb'
require 'app/controllers/welcome_controller.rb'
require 'app/models/user.rb'
require 'app/models/product.rb'
require 'app/models/category.rb'
require 'app/models/order.rb'
require 'app/models/order_detail.rb'

use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::CommonLogger
use Rack::ContentLength
use Frack::Router
run Frack::Application
