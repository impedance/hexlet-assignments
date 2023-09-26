# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
     status, headers, body = @app.call(env)
     request = Rack::Request.new(env)

     if request.path.include?('/admin')
      case request.request_method
      when 'GET'
        [403, {}, []]
      end
    else
      [status, headers, body]
    end
    # END
  end
end
