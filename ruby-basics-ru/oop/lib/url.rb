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

      @url.query.split('&').each do |query_parts|
        key, value = query_parts.split('=')
        result[key.to_sym] = value
      end
      result
    end

    def query_param(key, default_value = nil)
      query_params.fetch(key, default_value)
    end

    def <=>(other)
      [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]
    end

end
# END
