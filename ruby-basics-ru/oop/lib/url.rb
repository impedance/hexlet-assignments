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
      return {} if @url.query.nil?
      result = {}
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
      query_params == other.query_params
    end

end
# END
