require 'json'

module Rack

  class JsonStringify

    def initialize(app)
      @app = app
    end

    def call(env)
      @env = env

      status, headers, body = @app.call(env)
 
      return [400,{},[]] if self.stringify? && self.json_response?(headers['Content-Type'])

      if self.stringify?
        json = ''
        body.each { |s| json << s }
        body = [JSON.dump(self.stringify(JSON.parse(json)))]
        headers['Content-Length'] = Rack::Utils.bytesize(body[0]).to_s
      end

      [status, headers, body]
    end

    protected

      # Returns true whenever the response Content Type is set to application/json
      #
      # @param [String] content_Ctype the response content type
      # @return [TrueClass,FalseClass]
      def json_response?(content_type)
        !content_type.nil? && !content_type.match(/^application\/json/i).nil?
      end

      # Returns the given element with its value/all its values as String (except for nil, true and fasle)
      #
      # @param [String,Hash,Array,TrueClass,FalseClass,#to_s] element the element to be stringified
      # @return [String] the stringified element
      def stringify(element)
        return element if [nil, true, false].include?(element)

        case element.class.to_s
          when 'Hash'
            element.dup.each { |key, value| element[key] = self.stringify(value) }
            return element
          when 'Array'
            element.collect { |value| self.stringify(value) }
          else
            return element.to_s
        end
      end
      
      # Returns true whenever the current request must be stringified
      #
      # @return [TrueClass,FalseClass] 
      def stringify?
        "#{@env['X-ACCEPTED-TYPES']}".downcase == 'string'
      end

  end

end
