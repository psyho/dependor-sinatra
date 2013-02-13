module Dependor
  module Sinatra
    module Objects
      attr_reader :params, :env, :request, :response, :session

      def sinatra_objects(objects)
        @params = objects.params
        @env = objects.env
        @request = objects.request
        @response = objects.response
        @session = objects.session
      end

      def self.create(app)
        Values.new(app.params, app.env, app.request, app.response, app.session)
      end
    end

    class Values < Struct.new(:params, :env, :request, :response, :session)
    end
  end
end
