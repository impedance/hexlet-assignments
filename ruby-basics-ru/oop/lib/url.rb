# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
    extend Forwardable
    include Comparable
    def_delegators :@url, :scheme, :host, :port
    
    def initialize(url)
      @url = URI(url)
    end

    def query_params
      result = {}
      return result if @url.query.nil?

      @url.query.split('&').each do |item|
        key, value = item.split('=')
        result[key.to_sym] = value
      end
      result
    end

    def query_param(key, default_value = nil)
      if query_params[key]
        query_params[key]
      else
        default_value
      end
    end

    def <=>(other)
      if query_params == other.query_params && port == other.port
        0
      end
    end

end
# END
