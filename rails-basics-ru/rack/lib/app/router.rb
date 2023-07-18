# frozen_string_literal: true

require 'rack'
require 'json'

class Router
  def call(env)
    # BEGIN
     request = Rack::Request.new(env)
    if request.path == '/about'
      case request.request_method
      when 'GET'
        [200, {}, "About page" ]
      end
    elsif request.path == '/'
        [200, {}, "Hello, World!"]
    else
        [404, {}, "404 Not Found"]
    end
    # END
  end
end
