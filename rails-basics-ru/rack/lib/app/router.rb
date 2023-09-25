# frozen_string_literal: true

require 'rack'

class Router

  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    puts request
    # END
  end
end
