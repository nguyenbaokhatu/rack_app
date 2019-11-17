$LOAD_PATH << '.'
require 'rack'
require 'tilt'

require 'lib/frack'
require 'app/controllers/users_controller.rb'
require 'app/controllers/welcome_controller.rb'
require 'app/models/user.rb'

use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::CommonLogger
use Rack::ContentLength
run Frack::Application
