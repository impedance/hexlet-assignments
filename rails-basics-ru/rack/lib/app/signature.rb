# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    crypted_body = Digest::SHA2.new(256).hexdigest(body)
    [status, headers, [body, crypted_body]]
    # END
  end
end
