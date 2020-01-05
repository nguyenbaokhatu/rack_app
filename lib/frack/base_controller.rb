module Frack
  class BaseController
    attr_reader :env, :request

    def initialize(env)
      @env = env
      @request = Rack::Request.new(env)
    end

    def render(view)
      puts "------------------------------> view: #{view}"
      render_template('layouts/application') do
        render_template(view)
      end
    end

    def render_template(path, &block)
      Tilt.new("app/views/#{path}.html.erb").render(self, &block)
    end
  end
end
